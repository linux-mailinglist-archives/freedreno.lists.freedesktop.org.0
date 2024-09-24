Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA6984F0E
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9510E77C;
	Tue, 24 Sep 2024 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CKgd/x5R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075710E778
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:43:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so57197661fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727221412; x=1727826212; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aaB904nJswzSJ9sroCAmof81VYvbvVS4ZH/0WuYrOVM=;
 b=CKgd/x5RYE2N2FZjNEdH3X+Jgw/WUG/JiG4msjSY62AdCsqPmcJITgWm5QcDKwMwYw
 kqH6XJvG8XRcZOjUm9TMzlHPubZ3/L8ExrksLBvdhB3HgRB3grn8JgnK5Aohnu1jnQxt
 km3O5eq2jC0P9PFsXvFXiS78JKKG60X0lYSetX6K8aGj7gJVn+t2rDlqPUBCE7B0wGDO
 YZ99qBZsNWGkpBh/z0EdTLjMqpG2pdHc1Nxl31s+ifCwy0H/d78Py1faEpm3qF1gTbyv
 hWj80f0Y0l1f1wRm6tdRPIfcfblpz82bzIDWCe3JWnPq3+lQIQKcgTexQukLmZRqG3I3
 TPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727221412; x=1727826212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaB904nJswzSJ9sroCAmof81VYvbvVS4ZH/0WuYrOVM=;
 b=L9Qgdazg2LtTNhnD/hWdPkwHVF/M0R7trr1xZo50grERh9d+7+Qu8G69MmnwmwkYlr
 R+Ae/68w4hU32oLyt23JX3KKw/s1Sg/GK19Ar6ZCcuNdkiWYuDqiu3B7KCKAiKvfBrr/
 r800v7Sygz6px3X34qlTlYMlf1Ew2lx9TIAnKnnqTvWEMsZyx4SznuxkUqQH3kgk6l0F
 ZFPoPTna2P/7ZZ9osJ9h7+BBIiXBkSwkmsikgoRiK82UZLSSdJlmiUOsTUIOSkAdYJ1s
 hVuO7EeOgSndL2EsIopOmOGb3FQT0rv0PqlsW4YCXZYy4gJKg16jsViSK8XjSNVSgk3b
 ddPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtVKObeueT8fLNjddhu8dY6VfNG2c+PR4AEG0B8pj9Btq1IoM3hzDVpcUHnu7KyyIb26dmaSVdaJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyryfXhGDTwk2rMSUtZilB375epDGrTDCQJDNTkxY1FG7kkkJm
 g6qxs6pfRz+zVkSSK6zoAhIOA3GQIyvZWrB5mamAaBM/EP1RYgUEQ71A6kD7gX0=
X-Google-Smtp-Source: AGHT+IHJcmuOaUBwvlkEtZIKbGrA0Cs0d2P3fusjeaeBp5b7mIzG6VP9t/3bUVtxs0ZpUjKmoSc57g==
X-Received: by 2002:a2e:743:0:b0:2ef:2d3a:e70a with SMTP id
 38308e7fff4ca-2f915ff4b51mr3422621fa.18.1727221411893; 
 Tue, 24 Sep 2024 16:43:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d288e03fsm3521031fa.91.2024.09.24.16.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:43:30 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:43:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 20/22] drm/msm/dpu: Skip trigger flush and start for CWB
Message-ID: <tl4flcgmup2cdbbi4uiihkij4sqr7uscdfal6sw6443uixhhz5@z6jyokawiwh2>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-20-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:36PM GMT, Jessica Zhang wrote:
> For concurrent writeback, the real time encoder is responsible for
> trigger flush and trigger start. Return early for trigger start and
> trigger flush for the concurrent writeback encoders.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
