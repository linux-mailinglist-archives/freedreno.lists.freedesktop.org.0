Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DF19E8725
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 18:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394EC10E32F;
	Sun,  8 Dec 2024 17:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oFrH0KwN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9560510E334
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 17:50:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e274f149fso4130905e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733680215; x=1734285015; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
 b=oFrH0KwNLvZtK3DaLGt4M3A3s4JR8em7AjgVIywpmwkuvfvy+2y4VpXh5+34yXIqJY
 P2C+Hdit7tNwFm7Ly+qnsGdtdK2bx/0PfkrAYH4wFZIiJNCDljnJNnbZ8pMBZyij54y/
 IsVJCHrHBjxCf1tXlsRpHOcydykwBPUbbZl1CeNrVgmx3lpHMywRTYcqotMbYTZgXjdO
 gcBL/DG4BXr3I8gSgMFMsm3Kg7uxt48jKI55OrD1g9yxBPyHheDW+WoKvb833nwyU3+l
 RjJuXN0XEwviM8DYkO0Ip5WmWXVXPB5PYAcfoXOh13L3OxJt6jM28iH0j11Zn1kqMMtd
 g90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733680215; x=1734285015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
 b=chhCdylsiGGH4pWo8wj0ZDuJmm5pm5jY5jQwhMoGLRhnab+LltS5L1vLfejyLyeTgI
 exkl+iGzq2IMcszNTcRc2bnZUMItzrTwktWi2GKM2N+p+N+qtlNhJpVe0++QfH57Igqr
 j+6MDIHijiJYAm5L4EchgT5Zg267d69xmvolP88Po2EEok5QnObGQmIQjbSey++nZpfH
 JTv4Z20aqzNMvn05oIZpUhtBRLqWS+1B2DZ0g91C1wPI0jhVMKfBjkYaVSCICM4C9TuI
 Rf+4NiBQMhtLDB6NiYDGMn8+BNzgMjH1X99r2z7dNerr+lmcFZiq12TeDumMRwWbDXiV
 EVFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSZnNxzp6GASOFMteHbSZUhozmZfdxQvLR1JSAiQeKOJYUFCjRUC3M4/eLTydEYOswOeOgHQKs+rg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZscSI5DaWMO6UA5Go7W9scu5CHtGu5N52XGhALaeKmKOOB/gg
 iv4L0aVmhP55SQLPzn4Iob/Bwll5YYXJVTcg3oAZfEAjEwEr6smt3kCmoZgt3rI=
X-Gm-Gg: ASbGnct7nkhL/mDNlRXmSOoaWu4gLAsVby6rDaWxdt6cnqnbQ2d8bWEXtGknMKwWPX/
 0eae6AgL1haH7yGoUUzfAjx50F1bluAikDYNS3lD+/vijwQbbVz1Z6ExO3KceWCpSWPgl8dsgn1
 SUptHlJV3VKmAygHve9uz5gR5mld+ReLHgcyPmemqw9dkLiniE9Q3tSmJd74BtxzHJ2B1CDHBJK
 0nA8Hn2RME65eQUQo3C6cXP4UmTnqLMnxOBoSALM2zgttHUPFzeOqICvo/7XKWXpEnBKjFhbOfA
 eDv8CNBQyxUzpihiq2TeQK51SFa6CA==
X-Google-Smtp-Source: AGHT+IEVJLXOPnyFmKaPz9KPMKbv70YRlg73dziKIo45JVQh26G1HQVfDj7ebpdmC8hy5ZJT275q6A==
X-Received: by 2002:a05:6512:33d0:b0:53d:cfdb:c65c with SMTP id
 2adb3069b0e04-53e2c504c25mr3188513e87.52.1733680214661; 
 Sun, 08 Dec 2024 09:50:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3968850dsm659447e87.31.2024.12.08.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 09:50:13 -0800 (PST)
Date: Sun, 8 Dec 2024 19:50:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/45] drm/msm/dp: dont call
 dp_catalog_ctrl_mainlink_ctrl in dp_ctrl_configure_source_params()
Message-ID: <vemardbn3siohtg74hgjsnugkm4adqw6ekc4xhvjq3fty2rfov@5yhhsvjsnp6z>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:32PM -0800, Abhinav Kumar wrote:
> Once the link has already been setup there is no need to call
> dp_catalog_ctrl_mainlink_ctrl() as this does a reset on the mainlink
> thereby tearing down the link briefly.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
