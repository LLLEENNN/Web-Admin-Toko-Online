<?php

namespace App\Http\Controllers\Admin;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Exports\CustomersExport;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customers = Customer::latest()->when(request()->q, function ($customers) {
            $customers = $customers->where('name', 'like', '%' . request()->q . '%');
        })->paginate(20);
        return view('admin.customer.index', compact('customers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.customer.create');
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // dd($request->all());
        // die();

        $this->validate($request, [
            'name'      => 'required',
            'phone'      => 'required',
            'email'  => 'required'
        ]);

        $customer = Customer::create([
            'name'           => $request->name,
            'phone'           => $request->phone,
            'email'          => $request->email
        ]);

        // dd($slide);
        if ($customer) {
            //redirect dengan pesan sukses
            return redirect()->route('admin.customer.index')->with(['success' => 'Data Berhasil Disimpan!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('admin.customer.index')->with(['error' => 'Data Gagal Disimpan!']);
        }
    }



    public function edit(Customer $customer)
    {
        return view('admin.customer.edit', compact('customer'));
    }

    public function update(Request $request, Customer $customer)
    {
        $this->validate($request, [
            'name'      => 'required',
            'phone'      => 'required',
            'email'  => 'required'
        ]);

        //update dengan item baru
        $customer = Customer::findOrFail($customer->id);
        $customer->update([
            'name'           => $request->name,
            'phone'           => $request->phone,
            'email'          => $request->email
        ]);

        if ($customer) {
            //redirect dengan pesan sukses
            return redirect()->route('admin.customer.index')->with(['success' => 'Data Berhasil Diupdate!']);
        } else {
            //redirect dengan pesan error
            return redirect()->route('admin.customer.index')->with(['error' => 'Data Gagal Diupdate!']);
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $customer = Customer::findOrFail($id);
        $customer->delete();

        if ($customer) {
            return response()->json([
                'status' => 'success'
            ]);
        } else {
            return response()->json([
                'status' => 'error'
            ]);
        }
    }
}
