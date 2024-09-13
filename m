Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AC97801F
	for <lists+freedreno@lfdr.de>; Fri, 13 Sep 2024 14:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6A010E08E;
	Fri, 13 Sep 2024 12:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H06nsaUI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB8810E08E
 for <freedreno@lists.freedesktop.org>; Fri, 13 Sep 2024 12:36:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso11867281fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Sep 2024 05:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726230960; x=1726835760; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pFD+Jn1Q6UyyyHIKNy7SReGKO/WcduqlM7d7kkw/yoQ=;
 b=H06nsaUICPb/OuuTlAWaFB97pgKs/x4EQlyLiagt6VB8WyTPwt5PAavmMjpVSfJDXK
 KrlnwMFoSaS3DWqjOoZNLHNNXfze96uGmMjSxRNgFoPfzGRuufOvW01ZiA3YfeeEV6Zq
 Oh1hzfFB7x1h0rakIWReLuDCNyzi2WFYn5KMdyaNymO5GdOewE10osntYakmLpv3Hir3
 cCb5qrw5XuBFj3milEnXcv9rH0x7Q0a+TIYBTsuFt5rJ5sHCdVOXXH/NTmr58ZQUifAl
 7h2yctlca1c2TWAZkfSKACBkkTNlvisBIXRjILkbNF+ib02zeMklVIyZq6TsPpnJnSxY
 /gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726230960; x=1726835760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFD+Jn1Q6UyyyHIKNy7SReGKO/WcduqlM7d7kkw/yoQ=;
 b=O0hFIl6PzJS6M7urJXcs8TWVoKbMYro0AYh6hgAxoXEUd84PQzl7QLPPP0UobwrxIx
 L/YsQIatg01UJK1O6M/qclhJ9ZYqAi/3fgj3GtmkHqJ/Fsma2e9HxifHgrkWnYGmRbz4
 UYjQ7fLWzWqQzNRkvhzkgNBVCu1lbbbR+ClHDHMWwxABCR2YCi71WwZf8Cynz/DqLFDI
 2HrOr6ePQ3s3JXt0ullzf+9grvGeeoC+UhGlUpaUIlbioGB4wh4gzHhIUT42sVujHeUd
 1d9yLJnJff+T+h1YwD19FgGc5bhMP9j/PFnNUWPCjt8YAM9rnsWXBLeQpsu7+h0fQ0Sk
 0yoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkwWDlOD3V2nEi+Iphjaotzw7lfDptWFxqwTGmWmGMPsOXoFPsfURR697b4B7BYp4EYMyYFs3a++U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKXtYT9fE4lTgWLegbIX4AFoEoixjjZ8s2uWFm8EegBzKZy70C
 EHRa5SUa76x3hDoCpdXZ5MUe4bjbjNdb4XsZihLmzLX9d6OvnNlfZEqk7O+v5aQ=
X-Google-Smtp-Source: AGHT+IGNesu/TPONWtHH5WBVmOcBtC92jiJD8e2sxjheoT0Ix3+hqei4gExaNhCLth4BCHluhR74bA==
X-Received: by 2002:a2e:5119:0:b0:2f7:52c5:b75 with SMTP id
 38308e7fff4ca-2f7919044a3mr12114511fa.15.1726230958897; 
 Fri, 13 Sep 2024 05:35:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffc9d6sm22628751fa.42.2024.09.13.05.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 05:35:58 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:35:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, 
 quic_abhinavk@quicinc.com, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, 
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
Message-ID: <f6pyasnn34ufvrphfwiskkk75nuzbcjxqz2uuurk3wujubfaal@nyktpvjiaonn>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-4-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913103755.7290-4-quic_mukhopad@quicinc.com>
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

On Fri, Sep 13, 2024 at 04:07:53PM GMT, Soutrik Mukhopadhyay wrote:
> Add support for eDP PHY v5 found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: Fixed review comments from Dmitry
> 	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
> 
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 33 +++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
