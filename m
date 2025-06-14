Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF098AD9C29
	for <lists+freedreno@lfdr.de>; Sat, 14 Jun 2025 12:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DF510E02A;
	Sat, 14 Jun 2025 10:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Po3eqGlQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612810E02A
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 10:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749897539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
 b=Po3eqGlQJAq7R2XxvvMi7Tmj3yXgK+NfWPlS9SPOsNWQIH0+roer9X9X/9F65j7PsuFnlE
 t4fNQPfd9uOfrzpCQBHLv9coyiDzwV/Td8zjIyDVeJ+4IGty0pW4grt+zxljW2czq0n4AN
 70Sw+N8IX8FvVoQJpFx9bk66C9UlSRs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-HIL99D9uOAumgXwWrvY3Yg-1; Sat, 14 Jun 2025 06:38:58 -0400
X-MC-Unique: HIL99D9uOAumgXwWrvY3Yg-1
X-Mimecast-MFC-AGG-ID: HIL99D9uOAumgXwWrvY3Yg_1749897537
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a5780e8137so125157f8f.1
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 03:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749897537; x=1750502337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIANWIB6nwffMmsTBbNFHDHGCg1L4aQoyezG8SSvfNg=;
 b=SyTIB+dZ+fpxDT5EcQTEdfTG0KQ6u0yMrFKr4/TNkhoWtXS9CYcAgv7o0oZ0Uz9syA
 N6fCnMXU+ZTslQw/qxSzEooFyN5WyvsGEPi8bJO1p5iAiZGgEyOfSlsCdbeuSwUAzaOT
 sAhOsf4Y0liYnC3z0lGnFApgrbuXOXK8JsD6Cqz72aZpNabuo57r5VGkWwCCxzf6C+z5
 hE7B85Nx9Bmruya8WNHLNEnqQDXjJUktZa3b6+q9VfHacA7b+3hjQyQhM3tAec7wkaT7
 FjNgKiVWT/vnCv2hAS3eoF7rssbQQ6rifY8CqUj9CxSpOwigWP2Ongu6HUDYKiaLbnL4
 11Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt3E1e17n4IUC6KbSr3H46ooC4YigGEzISXpeT2iC8JArg3cJRFXjSe46jb8DCmwyY+c4vdofmp08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHkVruy2ReDmMFKhmypNdhNrj7r+UPZZCNCmVpK8TB5vULX33a
 l0z6uVBSoSIoRDeESi5rXWT6YN3ZdopUAWsbsU5j9tywwJj7XdkNjYPMY7fL9cWZpEwbiTf4MuJ
 GL3C1Pbn7em6+c02FQHr3v98fkbbFAGHxFRYCxOlISFE21bBIJl4ZEQuW6oY8Me0Jh7fCF8i22c
 VLUU6e
X-Gm-Gg: ASbGncspHRqhDZ3fnHmUGaVI7t0vTcM57nALEBWOBlEdJcgjaxRMNPT21bnOUYGT8yj
 57fcQU63u20QbWS/t6dNI0FPj2qo4egmGctKabD2IZSrfIC4B/+Bm6o3aZ3ZR4vR9R4d/Zi09bA
 On8sdH9XMPkc7VT8R7YNFv7EOSxgjSQW8w0vHPtx8uPrr8ctJYXw5N9TSuWs1bAT6F+ntSFEM5/
 8xUco/4iaZSSkRAm0oUgfGv+t4hOcDwabCRZYPe900udWtTNUc2B7HNf9fS9Eg0tfkt11PpNU17
 skhfw8vuN0I=
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id
 ffacd0b85a97d-3a56d84b061mr4246579f8f.27.1749897536732; 
 Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHukkp3GXm05X8ih8L/6TcAy+frWDO/6fM05ksvQmhRxI5FcoJb191KQKxBwD3XgtEhegeu5Q==
X-Received: by 2002:a05:6000:1787:b0:3a4:da0e:5170 with SMTP id
 ffacd0b85a97d-3a56d84b061mr4246560f8f.27.1749897536294; 
 Sat, 14 Jun 2025 03:38:56 -0700 (PDT)
Received: from pollux ([2a00:79c0:666:b300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e14f283sm79561175e9.27.2025.06.14.03.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jun 2025 03:38:55 -0700 (PDT)
Date: Sat, 14 Jun 2025 12:38:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aE1RPZ_-oFyM4COy@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0voBJrOkdm1qszcsxYa1Mf9XzsFXSz4aa_PzSlDI2Sc_1749897537
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> For UNMAP/REMAP steps we could be needing to lock objects that are not
> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> VAs.  These helpers handle locking/preparing the needed objects.

Yes, that's a common use-case. I think drivers typically iterate through their
drm_gpuva_ops to lock those objects.

I had a look at you link [1] and it seems that you keep a list of ops as well by
calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.

Please note that for exactly this case there is the op_alloc callback in
struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
msm_vm_op) that embedds a struct drm_gpuva_op.

Given that, I think the proposed locking helpers here would make more sense to
operate on struct drm_gpuva_ops, rather than the callbacks.

Besides that, few comments below.

--

One additional unrelated note, please don't use BUG_ON() in your default op
switch case. Hitting this case in a driver does not justify to panic the whole
kernel. BUG() should only be used if the machine really hits an unrecoverable
state. Please prefer a WARN_ON() splat instead.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c?ref_type=heads#L1150

> Note that these functions do not strictly require the VM changes to be
> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> call result in a differing sequence of steps when the VM changes are
> actually applied, it will be the same set of GEM objects involved, so
> the locking is still correct.

I'm not sure about this part, how can we be sure that's the case?

> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  8 ++++
>  2 files changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 0ca717130541..197066dd390b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
>  
> +static int
> +drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
> +{
> +	struct drm_exec *exec = priv;
> +
> +	switch (op->op) {
> +	case DRM_GPUVA_OP_REMAP:
> +		if (op->remap.unmap->va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
> +		return 0;
> +	case DRM_GPUVA_OP_UNMAP:
> +		if (op->unmap.va->gem.obj)
> +			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
> +		return 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct drm_gpuvm_ops lock_ops = {
> +	.sm_step_map = drm_gpuva_sm_step_lock,
> +	.sm_step_remap = drm_gpuva_sm_step_lock,
> +	.sm_step_unmap = drm_gpuva_sm_step_lock,
> +};
> +
> +/**
> + * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()

I think we should name this drm_gpuvm_sm_map_exec_lock() since it only makes
sense to call this from some drm_exec loop.

> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @exec: the &drm_exec locking context
> + * @num_fences: for newly mapped objects, the # of fences to reserve
> + * @req_addr: the start address of the range to unmap
> + * @req_range: the range of the mappings to unmap
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + *
> + * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
> + * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> + * will be newly mapped.
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
> +		      struct drm_exec *exec, unsigned int num_fences,
> +		      u64 req_addr, u64 req_range,
> +		      struct drm_gem_object *req_obj, u64 req_offset)
> +{
> +	if (req_obj) {
> +		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> +		if (ret)
> +			return ret;
> +	}

Let's move this to drm_gpuva_sm_step_lock().

> +
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> +				  req_addr, req_range,
> +				  req_obj, req_offset);
> +
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);

