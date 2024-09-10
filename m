Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51AD973A46
	for <lists+freedreno@lfdr.de>; Tue, 10 Sep 2024 16:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5400A10E833;
	Tue, 10 Sep 2024 14:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QeYKS4EM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAEF10E82F
 for <freedreno@lists.freedesktop.org>; Tue, 10 Sep 2024 14:45:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53568ffc525so1116029e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Sep 2024 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725979506; x=1726584306; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fyheDlGANeq6Wl6O+ghUD4wV0JahjuF+9A+tjmIT3aI=;
 b=QeYKS4EMXuOeexZGihWm9Hosl5UY/fXpYDRml9OZpz3zdKDvuGfMsXvSitUhI2HF8g
 cjGAoIENi/GYJh2OWwOttv/tLeamZni3UQBQOPaEhSRriw3ixysFz3jltKEfn+OecMTb
 C4zmofvt8pATBE1WuG60RPliEFsw7Hmk+j0cOJgGD+Atpsjo9bo+s8JttEsKjl4a67wY
 DXBGHypBVOKrwhb+aFkZ8UNDi51OwW8eV32IDYzfPIOPsHIHFK2emCqgpWV+dA6TaV7o
 AZh6HLLznK+iSms0On4dLIjdnKiuXwfu9UlEMZpADGH+OIQQAl+eXEtqshWYd9wbdFKE
 0HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725979506; x=1726584306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyheDlGANeq6Wl6O+ghUD4wV0JahjuF+9A+tjmIT3aI=;
 b=nrxPhWfRY5AXwE/AbL4+/fx+5aOsNd56hZtsAHdMaAKKecvD+ukdyNe2W/rn+uPIz8
 zBboh+mShhAtSR3IAjLDpTM/B7eLJBOwHqDpRDhOj6bXh/yfwrmzdM6xZtbTLeY6RjaE
 VM4+GI9gO6A8yCqLKZpZ8dYaltG6yGOCo0ZEvbMyJiD63ONHAqWsv8QWB9RyhWwXY3sm
 tpXPPM/ajRkR67T00s4pXe1RDYgKv7Qvc42sn/dOFd9JLIvLQ5ZL4PX+kr5AKv/y60fM
 aFiFljcgdQGmnVGdWwTX/O6NnYV+UpdZlWOQKdtFzYnF2I1MqzI9aJ22U3CzyPwqXfIT
 2OVw==
X-Gm-Message-State: AOJu0YxFtzUsRQRhu0Agg6IsfEmkNV9zLtsJK6dy8fg+F7vWc0UKstKP
 tOthgzydsAT6JNlVIu+GeM6X2NzTfPl7/g/SBIF/br7W3iJ0d50hD8OV1JZcnWY=
X-Google-Smtp-Source: AGHT+IGkucxQAPF17vtiwykU1NzQbKTsUYePLM268UsuU7sXnhSJr57nWX2ddN1l8A7ibNcX6hceFQ==
X-Received: by 2002:a05:6512:2385:b0:52e:9f17:841a with SMTP id
 2adb3069b0e04-536587a4006mr11605403e87.6.1725979505297; 
 Tue, 10 Sep 2024 07:45:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f90d8ebsm1190511e87.281.2024.09.10.07.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 07:45:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, 
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
Subject: Re: drm-ci: flaky tests for msm driver testing
Message-ID: <2t263tpqv53kqs3dv46x6obkh2cpw7jxj54hnyhxtbiu6tew33@c7ec7yhobqqv>
References: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
 <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
 <64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com>
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

On Tue, Sep 10, 2024 at 08:48:09AM GMT, Vignesh Raman wrote:
> Hi Maintainers,
> 
> On 12/07/24 11:35, Vignesh Raman wrote:
> > Hi Maintainers,
> > 
> > On 28/05/24 11:39, Vignesh Raman wrote:
> > > Hi Maintainers,
> > > 
> > > There are some flaky tests reported for msm driver testing in drm-ci
> > > for the below boards.
> > > 
> > > *)
> > > # Board Name: apq8096-db820c
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > dumb_buffer@create-clear
> > > 
> > > *)
> > > # Board Name: sc7180-trogdor-kingoftown
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > msm_mapping@shadow
> > > msm_shrink@copy-gpu-oom-32
> > > msm_shrink@copy-gpu-oom-8
> > > 
> > > *)
> > > # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > msm_mapping@shadow
> > > 
> > > *)
> > > # Board Name: sdm845-cheza-r3
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > kms_cursor_legacy@basic-flip-after-cursor-atomic
> > > kms_cursor_legacy@basic-flip-after-cursor-legacy
> > > kms_cursor_legacy@basic-flip-after-cursor-varying-size
> > > kms_cursor_legacy@basic-flip-before-cursor-varying-size
> > > kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> > > kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> > > kms_cursor_legacy@flip-vs-cursor-varying-size
> > > kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> > > kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> > > kms_cursor_legacy@short-flip-after-cursor-toggle
> > > kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> > > kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> > > msm_shrink@copy-gpu-32
> > > msm_shrink@copy-gpu-oom-32
> > > 
> > > Will add these tests in,
> > > drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> > > 
> > > (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> > > 
> > > Please could you have a look at these test results and let us know
> > > if you need more information. Thank you.
> > 
> > There are some flaky tests reported for msm driver testing in drm-ci
> > with the recent IGT uprev (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
> > 
> > *)
> > # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> > # Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> > # Failure Rate: 100
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_lease@page-flip-implicit-plane
> > 
> > *)
> > # Board Name: sdm845-cheza-r3
> > # Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> > # Failure Rate: 50
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_cursor_legacy@short-flip-before-cursor-toggle
> > kms_cursor_legacy@flip-vs-cursor-toggle
> > msm/msm_shrink@copy-mmap-oom-8s
> > 
> > The expectation files have been updated with these tests,
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> > 
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> There are some flaky tests reported for msm driver testing in drm-ci with
> the recent IGT uprev.
> 
> # Board Name: sdm845-cheza-r3
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_lease@page-flip-implicit-plane
> 
> # Board Name: sdm845-cheza-r3
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc5
> kms_flip@flip-vs-expired-vblank
> 
> The expectation files have been updated with these tests,
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> Please could you have a look at these test results and let us know if you
> need more information. Thank you.

Thanks for the info. We will discuss this internally.

-- 
With best wishes
Dmitry
