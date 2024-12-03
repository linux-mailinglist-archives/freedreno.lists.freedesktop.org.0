Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962479E1FCF
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 15:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761CE10EA3B;
	Tue,  3 Dec 2024 14:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SFZharmu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3A110EA3B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 14:43:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso5812787e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 06:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733236984; x=1733841784; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cb+J6HsaYxYWMCo/gkxHkiR/O2mDcIIC/9yfkkJhucI=;
 b=SFZharmuRxE9BNVgGX88NiUqL5TzNbNbik5T2NgxOOHy0A7z8NJG4MVIcw/X9NyOck
 hLv4OzmwV6vZcg9uzkGb/RA5Bhku/s+rFvA/TcGFfb3MXF/4erezE+m7lwtlCD5CNC28
 8tJBAdaIouRzHBsZEYu9Y3prkV9nRuOlQsOeJ7fPDsPjMeOqJqAIabPXN+tB5AcawA+W
 E3TTB629LwyQfgJVtxsa1R86M8120npa0xaJINKLeA5y2TYFEp48VQc2uCGlqe5LUgUs
 S3yGNEWVW9pO4du4fBzN/wTrwKqxqE3TjzBBAJ6duoEkGSNX+MP5ZwEimu4uolsXXlJw
 YJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733236984; x=1733841784;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cb+J6HsaYxYWMCo/gkxHkiR/O2mDcIIC/9yfkkJhucI=;
 b=VNfVRQ6SLDJ+R/+UzvBuhtAT2cMtgqbM1MxvUNDXOURV2f9W0ntwj+MTXiSPvzjltW
 p7ZYOxH2/7DzDEKKKeE0YTa5Nh/AQnZyL5z3oy9n7Cs07iq6B2KzxN4YIDk99R6h6OYP
 CsNhCqRGKUEAOrAlb64h/W+9iMa6o+KQqg0hgnL7S39w5GCqyHMHrNtrGYReKd3KEKSM
 GBxrLTShbxtXLjFCOAeO2EEBLhYyRpSPI1jDvjbVg+wmFO8KFgIwyDdR5lVM2QfdwfzL
 1G9HKI8kE7K419MrxY+5l1avVNHceJUQ2c9tBkvndwlzwqDVFbBgIQDAuvLDAapHNhYS
 Cpew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg8Sy7hnVxo6XbrR7GsEq/h64Qv9dHL1xxtvy1sAq5Nb8Mviw+T/DUKoJ2rVpi6LefSprGWfMUXY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3T9lbBIDKfiU83VOzbX8fCIyQCNRb5lW3F0EhAEAShrwEzOa3
 3yhJuQl0kSn9ncAOOs6U7OJqptwXbBukwDFt64f8S33iuD7/NpOLPpQiku7S6PE=
X-Gm-Gg: ASbGnctdPMUmcXzw7RZ5gSgy3pz7uq9jY4Z3z2298rB7cBv4wb6F8UrBso7SvDODUey
 OMLYKXBSSKDu1mlNAzUdn9PP/jmMvQ7gzEkMtCXwB4oOU4WqEv4Ycpel3zBoXNxbcCiSV1y3db9
 3GK13yBybCwUyV2Jve3TYeqXDQMXAzUj2+Lyxn2qKBiUyinY9UsJpXsRlOju+76PS3KcQfzMSyd
 XigSIhT1sd/YYzsAMEN2TS39kfEO8jo7je+33vu0ea4ULVCfEchU6DKrWdP3Jc7v7b2WrNQgSJB
 bFbyZTo+Wzn5ByAnecQ/CebduAZbuQ==
X-Google-Smtp-Source: AGHT+IHHLjHs+N3n+7uXDhRbEYTfdpsaOHGt7zvJPG2aKxlshASmuhpSpR6Ah1Ne0bSf1HsggFcbrA==
X-Received: by 2002:a05:6512:1116:b0:53d:ed75:6f0 with SMTP id
 2adb3069b0e04-53e12a27680mr1466207e87.35.1733236983863; 
 Tue, 03 Dec 2024 06:43:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1b053172sm89991e87.264.2024.12.03.06.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:43:02 -0800 (PST)
Date: Tue, 3 Dec 2024 16:43:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <xzifhulmjiwcouybnz2tw2am2kjcv5kbtslfgbsnyzhh3wpvpi@rfvdrfs2teyb>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
 <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
 <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
 <s6yaog7kffvbfzz3uhwvkfzxxe2n32sdefia3g75gffqhgjcjw@6fbifjd36yr7>
 <38445cf6-0f09-42df-a033-cd2a00c71e0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38445cf6-0f09-42df-a033-cd2a00c71e0a@gmail.com>
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

On Tue, Dec 03, 2024 at 03:36:08PM +0100, Danylo wrote:
> 
> 
> 
> On 12/3/24 14:34, Dmitry Baryshkov wrote:
> > On Tue, Dec 03, 2024 at 02:09:59PM +0100, Danylo wrote:
> > > 
> > > 
> > > On 12/3/24 13:52, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
> > > > > This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> > > > > implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
> > > > Could you please spend more words, describing what it is and why is it
> > > > necessary for those extensions. For a5xx+ it looks like some kind of an
> > > > internal address (what kind of?). For a4xx I'm completely lost.
> > > Yes, my bad. On at least a6xx+, shader could read 64b ALWAYSON counter
> > > from UCHE_TRAP_BASE+0 address. We use it to implement VK_KHR_shader_clock:
> > >   "This extension advertises the SPIR-V ShaderClockKHR capability for Vulkan,
> > > which
> > >    allows a shader to query a real-time or monotonically incrementing counter
> > > at
> > >    the subgroup level or across the device level."
> > > And there is no other proper way to get such counter. Same with
> > > GL_ARB_shader_clock.
> > Yes, please add this to the commit message.
> Ok.
> 
> > > Not sure what's there on older gens, I exposed the value on them for the
> > > completeness sake. But I don't know whether it is desired or not (I don't
> > > expect
> > > the value being read and used on a4xx/a5xx in Mesa).
> > Do you know if there is anything interesting in that region on a4xx /
> > a5xx (or at least if it's a region on a4xx?) Also how will that
> > GET_PARAM behave on a2xx-a3xx? Will it return 0 or some -EINVAL?
> I don't know if there is anything interesting there on a5xx or a4xx.
> I booted a5xx board I dug up, but found out that on a5xx we are
> even missing the instruction to read from memory address, so I wasn't
> able to check what's at that address.

lol, ok.

> 
> As for what to return on a2xx-a3xx, as suggested by Rob,
> I'll rebase on https://patchwork.freedesktop.org/series/141667/ then
> I will return EINVAL:
>         if (adreno_gpu->uche_trap_base == 0)
>             return UERR(EINVAL, drm, "no uche trap base");

Great, thanks. I think that fixes my concerns.

> 
> > > > > Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
> > > > >    drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
> > > > >    drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
> > > > >    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
> > > > >    drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
> > > > >    include/uapi/drm/msm_drm.h              |  1 +
> > > > >    6 files changed, 23 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > > > index 50c490b492f0..f1b18a6663f7 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > > > @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
> > > > >    		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
> > > > >    	/* Disable L2 bypass to avoid UCHE out of bounds errors */
> > > > > -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> > > > > -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> > > > > +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > > > +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > > > >    	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
> > > > >    			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> > > > > @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
> > > > >    	if (ret)
> > > > >    		goto fail;
> > > > > +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
> > > > > +
> > > > >    	if (!gpu->aspace) {
> > > > >    		/* TODO we think it is possible to configure the GPU to
> > > > >    		 * restrict access to VRAM carveout.  But the required
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > > > index ee89db72e36e..caf2c0a7a29f 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > > > @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > > > >    	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
> > > > >    	/* Disable L2 bypass in the UCHE */
> > > > > -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> > > > > -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> > > > > -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> > > > > -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> > > > > +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > > > +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > > > > +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > > > +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > > > >    	/* Set the GMEM VA range (0 to gpu->gmem) */
> > > > >    	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> > > > > @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
> > > > >    	adreno_gpu->ubwc_config.macrotile_mode = 0;
> > > > >    	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
> > > > > +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
> > > > > +
> > > > >    	return gpu;
> > > > >    }
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > index 019610341df1..0ae29a7c8a4d 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > > @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
> > > > >    	/* Disable L2 bypass in the UCHE */
> > > > >    	if (adreno_is_a7xx(adreno_gpu)) {
> > > > > -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> > > > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> > > > > +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> > > > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
> > > > >    	} else {
> > > > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
> > > > > -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> > > > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> > > > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
> > > > > +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> > > > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
> > > > >    	}
> > > > >    	if (!(adreno_is_a650_family(adreno_gpu) ||
> > > > > @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > > >    		}
> > > > >    	}
> > > > > +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
> > > > > +
> > > > >    	if (gpu->aspace)
> > > > >    		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
> > > > >    				a6xx_fault_handler);
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > index 076be0473eb5..774ff6eacb9f 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > > > >    	case MSM_PARAM_MACROTILE_MODE:
> > > > >    		*value = adreno_gpu->ubwc_config.macrotile_mode;
> > > > >    		return 0;
> > > > > +	case MSM_PARAM_UCHE_TRAP_BASE:
> > > > > +		*value = adreno_gpu->uche_trap_base;
> > > > > +		return 0;
> > > > >    	default:
> > > > >    		DBG("%s: invalid param: %u", gpu->name, param);
> > > > >    		return -EINVAL;
> > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > index e71f420f8b3a..9bd38dda4308 100644
> > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > > > @@ -253,6 +253,8 @@ struct adreno_gpu {
> > > > >    	bool gmu_is_wrapper;
> > > > >    	bool has_ray_tracing;
> > > > > +
> > > > > +	u64 uche_trap_base;
> > > > >    };
> > > > >    #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> > > > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > > > index b916aab80dde..2342cb90857e 100644
> > > > > --- a/include/uapi/drm/msm_drm.h
> > > > > +++ b/include/uapi/drm/msm_drm.h
> > > > > @@ -90,6 +90,7 @@ struct drm_msm_timespec {
> > > > >    #define MSM_PARAM_RAYTRACING 0x11 /* RO */
> > > > >    #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> > > > >    #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> > > > > +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > > > >    /* For backwards compat.  The original support for preemption was based on
> > > > >     * a single ring per priority level so # of priority levels equals the #
> > > > > -- 
> > > > > 2.46.2
> > > > > 
> 

-- 
With best wishes
Dmitry
