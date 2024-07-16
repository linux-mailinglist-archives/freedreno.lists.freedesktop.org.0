Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82F932E9F
	for <lists+freedreno@lfdr.de>; Tue, 16 Jul 2024 18:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98210E80C;
	Tue, 16 Jul 2024 16:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WV0A0ELF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BFE10E7E7
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 16:49:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52ea7d2a039so6032873e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721148563; x=1721753363; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=65UHivhWbqamlbWLtwDGoTnNBO4Z+XQXbLxohA6X8UI=;
 b=WV0A0ELFn0GwcUNHQAnd82W8gGMF0nW4PzTf04KXZEMYCfaUqXNyj+7Ha4a5qXFWHS
 ehFRCpOEfxvHLY5ZZlz336JQyrlUtx8O8Q0lEkbblNpcYOjDCQWE3OLW9CaBhxbAHK/l
 dlGc7PY7UDSrYd+HnHM3TliWAvFnC2HhMHohRIUysoLE3qV66pd7+42GW4iQY3L8xgq+
 gqxj9YZor9kPpkiJs4IFaD6N5QHFM4Lubjr+aCuXwdQ5l/3p3TLwnrgCp2r+77K/8rEl
 USMzY5c2XpMYrJqWkoXFjeh6FFEyGiNGejzUccHZiDY3i9Dfpnutur1BmXahaAZgz5RM
 7Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721148563; x=1721753363;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65UHivhWbqamlbWLtwDGoTnNBO4Z+XQXbLxohA6X8UI=;
 b=IR5VTtzrY2cAktv8MYgDSpbkTF/5M6VyfNxy0RDIJX1i4/p+LA41T7P6EVtGcKNsxM
 LK/xKTYoqP7vrS9abwITgbpGipTcnlrq5rygKehWb+Zwzw/9FbLPg1GwWUbUHBUqr86Y
 finHfamu/0lpc71iqnztD33z32yR1FJCrRWEeIm85vfX2S+kZCxeEp+coUgT4QZojJrr
 uiXS3hSr5gWPyzHoEpHzGvWweHwiwd5tlYy5FT3KEFIsJlqImr094SOA298pE0GPmAEI
 +Ir2qocbrLWMDC9yg8hLW4LDl1BJlYeVJ47jpNWddNOddCNb4gByUH31AkrH0nhL7HFm
 Kzqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ7uVmh1x+pfTTTtD0nejk5UjiFzoe+4z9Q0dS4T4S+YcnLaKdk0cCrRd5cd6sdJ5Mohw3LimNBgQdKikQD6pFGioIburTF2ffpuYTbvF/
X-Gm-Message-State: AOJu0YzWfSJxkGPtRk+F70EJ0L/oHciFcmZs4FcGPNrTyGzzqbMUHNfm
 y4jouke+DC74GPtnYg2j1K+2h4acXyBKxk7ykOkRUz27vqeF++8ucT0K3VcB1Q0=
X-Google-Smtp-Source: AGHT+IFISfVY1DZpBjx4Wp3ciQ7fxNNvKnRXnv4p72o9tKeFET0doI963w/f62exGm7NboBWy2kYvQ==
X-Received: by 2002:a05:6512:12ce:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-52edf02b9a6mr2138832e87.48.1721148562872; 
 Tue, 16 Jul 2024 09:49:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f3b9bsm1179441e87.107.2024.07.16.09.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 09:49:21 -0700 (PDT)
Date: Tue, 16 Jul 2024 19:49:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Fix error return if missing firmware-name
Message-ID: <ewrp4snurz4vvo5f5hdipzrndeij35j4h77bybkti2yiexk2gl@utuf7u5g3f4k>
References: <20240716160631.386713-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716160631.386713-1-robdclark@gmail.com>
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

On Tue, Jul 16, 2024 at 09:06:30AM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> -ENODEV is used to signify that there is no zap shader for the platform,
> and the CPU can directly take the GPU out of secure mode.  We want to
> use this return code when there is no zap-shader node.  But not when
> there is, but without a firmware-name property.  This case we want to
> treat as-if the needed fw is not found.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
