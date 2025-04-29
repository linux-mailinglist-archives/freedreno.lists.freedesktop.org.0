Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CFAAA1108
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 17:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB8310E105;
	Tue, 29 Apr 2025 15:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JGDE8Uos";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D169210E128
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 15:55:02 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so5286835b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745942102; x=1746546902;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
 b=JGDE8UosQLIPjzV0TXkNH3ohwlyXm6mwiaxBLmOhH5qLlbcIKrq4gp8NgVTN85km8c
 8WRpDO+6uiFZ5e4ArMvSs/0di4/w9aBdV7LY0dflQs1Tf7XFV/mwSPCRqzBN5ZgLApQm
 9IQ1WeZuDLKIccYE4DEyvEL8iFAjF3RM92yZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745942102; x=1746546902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
 b=fTdBtxpl0ofm42N9sIM82TRhqS1Ij29dF6FWbEOj+VstDV0pR779ij62z9riOHpDi5
 KALrx4NfEXq7R56VfN59UwoNd84drwLvdqeGU9y+4lPfH1sm0UvTnilY9WxjBiS/Rnmr
 1oMHdxUyKQ9B33SlQiQWRYNjVZX5BfOUsA4oQj6iSBoVfmuyr3qF4Fu1xCWiOYk1VDyu
 zee9HbnL/Q0lExwxH6CmwKjQr3ffGiM8fRQj4yF3rL4Whw+gqeozV0Iit82KEcRX+Q9+
 Yra2hfAnuWU2mjCJlG6EkLN3p9AmoGSPkwLRlfvayHyjIfFmhpD+c3+pA8cGXc3kYb13
 OkMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWFEXx82/F4s8NOs3E+q2NpufCRodjdtSYXq6JpOQ+iIDEfoTNJq9nPWYLPnkSddZQeS6dbn2YLug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYNwlUr22kOzuxhzfjBtIgtYDdMKVZXuOwrTe3qTn9E1YgIjPn
 Bpf5o+z1wPgAUdog2/WdwtlKPIKxIeWrqJLwKCge7a/UCowTLI8stZxpy/qgPyz1O79081ovCMQ
 =
X-Gm-Gg: ASbGncse8xe2jtKUsB57ODvYhpLPWpLpgBNi2lU09oA2xwu3FJmNYKhQyU/+B0YmxfI
 2S/LvHAxmvqFlp6z5syM3i70IBYDZhZQXUIcRzmRWUgVvWWao13YmESQbu0vcEu7zfY7p8UVF1g
 zJuhgpiespTQLDSBZsojy5MWAwgPwmBNYX7yTMS6rRydRV/VadRVT51EbKswLvF7NE2amS8glHU
 u5GGNqUEYbRxkad2THZS0/Ki87ZTfY4SShRNLB+Iefeq85MzaBZu46v6cUVFRmrHaXuA3D5lDWM
 TmfOF/4wn3ina3kSPIpBk82MtwqO5i7rRXcxCfH6wEllUrQ++WZuP4L8jYqDEDINy4X/yQypyS9
 Yls5vmsGB88TytDQ=
X-Google-Smtp-Source: AGHT+IGRla9DMNglzHQLOOlLl6agN2MrPJcZgkdk9C2lnmxHILhPhth/38ltn/pJJRogZ58/A+lByw==
X-Received: by 2002:a05:6a20:9f4a:b0:1f5:535c:82d6 with SMTP id
 adf61e73a8af0-2093ec16264mr6406784637.35.1745942101770; 
 Tue, 29 Apr 2025 08:55:01 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com.
 [209.85.216.53]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9d443sm10074270b3a.150.2025.04.29.08.55.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-306b6ae4fb2so5662501a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFiOf9OmXGFe4EAtYD8EvuMQV+ff3iaBPyyXLxayIP8D0Q49+MUWqt2KTDbCb0YaEJ4ctYzpgELOg=@lists.freedesktop.org
X-Received: by 2002:a17:90b:55d0:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-30a21593a3emr5985847a91.25.1745942100102; Tue, 29 Apr 2025
 08:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
In-Reply-To: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 08:54:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
X-Gm-Features: ATxdqUGCzdY0LXwBhAEJ2CeDRyHbock5i9Oan9LqNpeHcunKB9U1sJnJz2v4j0U
Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Apr 29, 2025 at 1:34=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> There is a small chance that the GPU is already hot during boot. In that
> case, the call to of_devfreq_cooling_register() will immediately try to
> apply devfreq cooling, as seen in the following crash:
>
>   Unable to handle kernel paging request at virtual address 0000000000014=
110
>   pc : a6xx_gpu_busy+0x1c/0x58 [msm]
>   lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
>   Call trace:
>    a6xx_gpu_busy+0x1c/0x58 [msm] (P)
>    devfreq_simple_ondemand_func+0x3c/0x150
>    devfreq_update_target+0x44/0xd8
>    qos_max_notifier_call+0x30/0x84
>    blocking_notifier_call_chain+0x6c/0xa0
>    pm_qos_update_target+0xd0/0x110
>    freq_qos_apply+0x3c/0x74
>    apply_constraint+0x88/0x148
>    __dev_pm_qos_update_request+0x7c/0xcc
>    dev_pm_qos_update_request+0x38/0x5c
>    devfreq_cooling_set_cur_state+0x98/0xf0
>    __thermal_cdev_update+0x64/0xb4
>    thermal_cdev_update+0x4c/0x58
>    step_wise_manage+0x1f0/0x318
>    __thermal_zone_device_update+0x278/0x424
>    __thermal_cooling_device_register+0x2bc/0x308
>    thermal_of_cooling_device_register+0x10/0x1c
>    of_devfreq_cooling_register_power+0x240/0x2bc
>    of_devfreq_cooling_register+0x14/0x20
>    msm_devfreq_init+0xc4/0x1a0 [msm]
>    msm_gpu_init+0x304/0x574 [msm]
>    adreno_gpu_init+0x1c4/0x2e0 [msm]
>    a6xx_gpu_init+0x5c8/0x9c8 [msm]
>    adreno_bind+0x2a8/0x33c [msm]
>    ...
>
> At this point we haven't initialized the GMU at all yet, so we cannot rea=
d
> the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed befor=
e
> in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
> 6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), bu=
t
> unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
> accordingly. This means the df->suspended flag does not match the actual
> devfreq state after initialization and msm_devfreq_get_dev_status() will
> end up accessing GMU registers, causing the crash.
>
> Fix this by setting df->suspended correctly during initialization.
>
> Cc: stable@vger.kernel.org
> Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx=
 gpu_busy")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
