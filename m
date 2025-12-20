Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B1CD2CE4
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 11:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576710E232;
	Sat, 20 Dec 2025 10:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Fq214dmH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113310E232
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 10:05:38 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b801b94fedcso283805066b.2
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 02:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766225137; x=1766829937;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+5We+jBO0+cCD3c++ROAWKy2uW8li7ctcnKyzh7ve8o=;
 b=Fq214dmHve4crsGTs5FRs/zXb/FV56KVjA5g/kL+O6HjMcsYjVcDoXEvH9NUpSYPUe
 pdPJwI14yEmYw+qrLpxPBTpYk3YctXWmwcrXVBrQmwtpeF4c44MxO+6fAlN4zKvA6kvz
 1kx5mF0FC4lFfRFQqfuCWZX9aPT/WqUU2svyuZzB7yyGNhRdlwSQOTx6wQI3tF9nRkmc
 vxbAezIp0TY7TIgvMbB7LMPFfXWtqx2jyzoeWZRyG88nwiopyuSq5TmUbSxX87b9rBRj
 uijT7s6Ciq1XEtU1JRBpzpWsC6Vw1jpLPRFoMtam0jN2iszZ15uVMUSBdT9sN7IDBUGp
 R+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766225137; x=1766829937;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5We+jBO0+cCD3c++ROAWKy2uW8li7ctcnKyzh7ve8o=;
 b=fNUcyZnuzqkeqMCcUrdpzAeqxkVa+SmGCaR2wsZS+gnKMizxaZpo0LQ+diwmYvfYdq
 5SDpg9fIg3WDX90dMf/NzpOmv5EiKhF/dQC9CWJH+j9mN3h0RSkegPZtuxfwu67YCi5W
 H8zcQUZsKS16QKVXrvuu2x+7uV7/F5G460e4IgogI4C+Nvl2F5QPpcd6ScCKrZYZd2Ip
 4NHIUIpCkN63h+x+aOlyOAwCeJd8Doam9sxmzdBtRwibro4xbT4zhgPsRL84tq6+RjeJ
 bHc3+QH5Tksr8l3WM8EvzuaOs2QY5rFDTiptuSKvRMTH8SKy+EcDesk+Gad6ZZapkzGq
 fotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFAOHAJbL7TeynNefXsTU2yVNmbV++MXMadpArktARtIHy+YJBD1XzKtOKXu//O+urnJ8oAfBLSOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLS4vWWIUn3Vbit960/0XLjJWJKJBL8r2GVEt/rLoVKhKTdHcq
 LJUbDtGiNNMcRkwi6DIBOxA7mabNEUWpYBf0ObTcr7v0r6rz5AEMVvs+CfEOgD7ZakbMvV0taWf
 aIFWWQ3aJU9UeDUq25Q==
X-Google-Smtp-Source: AGHT+IH+qbCL3E4KlR/xCuII76jDF4Kk0p12le+sQrE5wjNjdmbXoR9Ff184WWDRAFxJ6twYy7w7Nft4HG28DGY=
X-Received: from edtn6.prod.google.com ([2002:aa7:db46:0:b0:64b:a192:b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7814:b0:b80:4141:a470 with SMTP id
 a640c23a62f3a-b804141a5d5mr252551866b.6.1766225136958; 
 Sat, 20 Dec 2025 02:05:36 -0800 (PST)
Date: Sat, 20 Dec 2025 10:05:35 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ07zYew7Mfwc_C@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:
> On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> > On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > > +    #[inline]
> > > +    pub fn obtain(
> > > +        &self,
> > > +        obj: &T::Object,
> > > +        data: impl PinInit<T::VmBoData>,
> > > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > > +    }
> > 
> > Does this method make sense? We usually preallocate a VM_BO, then enter the
> > fence signalling critical path and then obtain the VM_BO.
> 
> Hmm, but there is something tricky here. When do we add it to the extobj
> list, then? If we add it before starting the critical path, then we must
> also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
> path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
> adding it to extobj after signalling the fence seems error prone.
> 
> And besides, adding it to the extobj list before the critical path
> means that we can have drm_gpuvm_exec_lock() lock the new BO without
> having to do anything special - it's simply in the extobj list by the
> time we call drm_gpuvm_exec_lock().
> 
> > > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > > +    #[inline]
> > > +    fn deref_mut(&mut self) -> &mut T {
> > > +        // SAFETY: By the type invariants we may access `core`.
> > > +        unsafe { &mut *self.0.core.get() }
> > > +    }
> > > +}
> > 
> > Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> > data_mut().
> 
> That's fair.
> 
> > > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > > +    #[inline]
> > > +    fn drop(&mut self) {
> > > +        // SAFETY: It's safe to perform a deferred put in any context.
> > > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> > 
> > This does not need to be deferred, no?
> 
> I think what I *actually* want to call here is
> 
> 	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);
> 
> like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
> this series.
> 
> > > +    }
> > > +}
> > > +
> > > +/// A [`GpuVmBo`] object in the GEM list.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> > 
> > How is this different from GpuVmBo? The only object that is not in the GEM list
> > should be GpuVmBoAlloc, i.e. the preallocated one.
> 
> The difference is whether there is pointer indirection or not.
> 
> This type is morally an ARef<GpuVm<T>>, except I don't expose any way
> to increment the refcount.
> 
> Alice
