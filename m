Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21598D8A49
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAF310E3D5;
	Mon,  3 Jun 2024 19:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XBrOEsxy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143FE10E1BC
 for <freedreno@lists.freedesktop.org>; Thu, 16 May 2024 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715865340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0l6u6hPd0VabUs35cq4b+ucitv/6ESbFrYjDHjfIiEE=;
 b=XBrOEsxyDLwPit529DjKUfkV91YUdrA5nsBjMJw/jvPLHO5imk/WTDerXT+EC37Wu22k0x
 aPxSJZsPfahBsPvoZ5BvvVv5+dQW19sp+vlzTYcAkfh3u4Oc1UFzGKMLMnxyiT7vDg2CX5
 OEEFn5wODttKazYKaX7yWw5+scz2aek=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-kMF1FSL8PKGPaGsw2k5Pjw-1; Thu, 16 May 2024 09:15:38 -0400
X-MC-Unique: kMF1FSL8PKGPaGsw2k5Pjw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-792c3d2b6beso1024605785a.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 May 2024 06:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715865338; x=1716470138;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0l6u6hPd0VabUs35cq4b+ucitv/6ESbFrYjDHjfIiEE=;
 b=LGnaSnBFj2xXep4a6fXd0oGvpwYEL7pmM4mY859Nw+kZ0XSP0RVVaZrJBG3yNFNJbh
 OQPTvQwzCQabOOwLu82OnE3GhFRCbmvwq3yqjGQpaljOHApuZl2i0VPk6nVjtgvVdiKb
 HuIlBYvEash4p0T3S7c6pu28MZdAXS5uQ2+DcoTjoI+3umX6oH4V+O3dPMJRNB45wn6F
 dV+jaijRIV0G+kYF9rzlKNge31AfMKO3Ge6zPqb10cY4u3xSevo8/w8W8Cr9qonKOHni
 tqDevCtY6ZKnoZLrOQGDarH7oLdMqGAzVm7f8/eZkGiqSjL3ehNNx1ka4G7rZSfQausA
 FGJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOmVAk3Gd0915CwZO9yBWHGcRh4ytRsVFhTE9Y874+fr2ldrgE/V6K2l3doIvMb1LkS8CcRs6rmrgWxkkBd1fujEwvv3F2gVsF1CmkKA4G
X-Gm-Message-State: AOJu0YyhAr1vymX/p4w3aaiVwHcuc0Q2me6DYvGk51/DLbO/gmoo9GBd
 EZ7PqBGMCFAf6VhNJF2qr+VllAgoSvX2WyfyOHLdN7rbxhGJyhbA1n7+dCoS/iD0Rx6hYa3odDH
 SvULikdBshm3mGa2xjuO66Yi/svTWvg2sC/p0hm0kVgaIY/aIWKHSJ5y8wPngi1kYmA==
X-Received: by 2002:a05:6214:3d8d:b0:6a0:b9bf:3cb3 with SMTP id
 6a1803df08f44-6a1681da9a9mr236654716d6.34.1715865337745; 
 Thu, 16 May 2024 06:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5l63B/ThTFOUu+b8+mZcUqIP+JY7JfnEdLxlBSrypwCMC29xnG1Oe9RFOjzz7TJMZvMGXJg==
X-Received: by 2002:a05:6214:3d8d:b0:6a0:b9bf:3cb3 with SMTP id
 6a1803df08f44-6a1681da9a9mr236654376d6.34.1715865337094; 
 Thu, 16 May 2024 06:15:37 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1852fdsm75706596d6.32.2024.05.16.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 06:15:36 -0700 (PDT)
Date: Thu, 16 May 2024 08:15:34 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 03 Jun 2024 19:38:24 +0000
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

On Wed, May 15, 2024 at 12:08:49AM GMT, Akhil P Oommen wrote:
> On Wed, May 08, 2024 at 07:46:31PM +0200, Konrad Dybcio wrote:
> > Memory barriers help ensure instruction ordering, NOT time and order
> > of actual write arrival at other observers (e.g. memory-mapped IP).
> > On architectures employing weak memory ordering, the latter can be a
> > giant pain point, and it has been as part of this driver.
> > 
> > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > readl/writel, which include r/w (respectively) barriers.
> > 
> > Replace the barriers with a readback that ensures the previous writes
> > have exited the write buffer (as the CPU must flush the write to the
> > register it's trying to read back) and subsequently remove the hack
> > introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
> > status in hw_init").

For what its worth, I've been eyeing (but haven't tested) sending some
patches to clean up dsi_phy_write_udelay/ndelay(). There's no ordering
guarantee between a writel() and a delay(), so the expected "write then
delay" sequence might not be happening.. you need to write, read, delay.

memory-barriers.txt:

	5. A readX() by a CPU thread from the peripheral will complete before
	   any subsequent delay() loop can begin execution on the same thread.
	   This ensures that two MMIO register writes by the CPU to a peripheral
	   will arrive at least 1us apart if the first write is immediately read
	   back with readX() and udelay(1) is called prior to the second
	   writeX():

		writel(42, DEVICE_REGISTER_0); // Arrives at the device...
		readl(DEVICE_REGISTER_0);
		udelay(1);
		writel(42, DEVICE_REGISTER_1); // ...at least 1us before this.

> > 
> > Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
> >  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> I prefer this version compared to the v2. A helper routine is
> unnecessary here because:
> 1. there are very few scenarios where we have to read back the same
> register.
> 2. we may accidently readback a write only register.
> 
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 0e3dfd4c2bc8..4135a53b55a7 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >  	int ret;
> >  	u32 val;
> >  
> > -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> > -	/* Wait for the register to finish posting */
> > -	wmb();
> > +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> > +	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
> 
> This is unnecessary because we are polling on a register on the same port below. But I think we
> can replace "wmb()" above with "mb()" to avoid reordering between read
> and write IO instructions.

If I understand correctly, you don't need any memory barrier.
writel()/readl()'s are ordered to the same endpoint. That goes for all
the reordering/barrier comments mentioned below too.

device-io.rst:

    The read and write functions are defined to be ordered. That is the
    compiler is not permitted to reorder the I/O sequence. When the ordering
    can be compiler optimised, you can use __readb() and friends to
    indicate the relaxed ordering. Use this with care.

memory-barriers.txt:

     (*) readX(), writeX():

	    The readX() and writeX() MMIO accessors take a pointer to the
	    peripheral being accessed as an __iomem * parameter. For pointers
	    mapped with the default I/O attributes (e.g. those returned by
	    ioremap()), the ordering guarantees are as follows:

	    1. All readX() and writeX() accesses to the same peripheral are ordered
	       with respect to each other. This ensures that MMIO register accesses
	       by the same CPU thread to a particular device will arrive in program
	       order.


> 
> >  
> >  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> >  		val & (1 << 1), 100, 10000);
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 973872ad0474..0acbc38b8e70 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
> >  	}
> >  
> >  	/* Clear GBIF halt in case GX domain was not collapsed */
> > +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> 
> We need a full barrier here to avoid reordering. Also, lets add a
> comment about why we are doing this odd looking sequence.
> 
> > +	gpu_read(gpu, REG_A6XX_GBIF_HALT);
> >  	if (adreno_is_a619_holi(adreno_gpu)) {
> > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> >  		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> > -		/* Let's make extra sure that the GPU can access the memory.. */
> > -		mb();
> 
> We need a full barrier here.
> 
> > +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
> >  	} else if (a6xx_has_gbif(adreno_gpu)) {
> > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> >  		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> > -		/* Let's make extra sure that the GPU can access the memory.. */
> > -		mb();
> 
> We need a full barrier here.
> 
> > +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> >  	}
> >  
> > -	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> > -	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> > -		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> > -
> 
> Why is this removed?
> 
> -Akhil
> 
> >  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
> >  
> >  	if (adreno_is_a619_holi(adreno_gpu))
> > 
> > ---
> > base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
> > change-id: 20240508-topic-adreno-a2d199cd4152
> > 
> > Best regards,
> > -- 
> > Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> 

