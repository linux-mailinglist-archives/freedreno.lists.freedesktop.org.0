Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4054A43A9D
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 11:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A29F10E5EA;
	Tue, 25 Feb 2025 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xNnN3GVZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7129710E5EC
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 10:04:52 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5484fa1401cso1195795e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740477891; x=1741082691; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
 b=xNnN3GVZtp+hDbBr6Zitdm/o/iZ4Z2I1YfttUczAypEStm0LqU/YG+d5vReNhSy/AD
 OPaGd3KTFbTDvemaybHEnEGyPFQoZC+P53OfkM0mB6OpMpcNhmzsP4wo9ko0pG0CK4Re
 FLi21l/pQ0TuwPfiDOrYrBq/m60D0vE3ac/hcAlaZkNoQxbOTKMvf3XNru5Sa7J4vht/
 P7UzplnQ9o0wiThi+xqR2b2aj1cHkbClPuoFsEeqkHbA23zoqJCSBps1uGca3f32qvzR
 hCijrjSuQE6DwrGr5kIMOXLGhFN3HBE1GAyq7OyH/l1E3cq3/WvZSb9d1OdB98N+hw2U
 /gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740477891; x=1741082691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
 b=VfdUXEdliDbN0kmbrzYJ57LcF2HrXHuFFQzmjaQQXCryFecG2h6VWTsWe8+HaQd1KP
 NOXCywqAkC8I4m8qngCpI+yN1bJjDFZyHXS4ma4Of4FHnucwdtZ6n2LAoxqpoiNODImn
 JTKvI78VrCg3ok1UOL2A2wym5QoYa76gc3LPqOiY2DJng11DRPMrcLZHlSCExSiKJcQg
 hP5hJzHpN0ePTv+lQkC5n4Pfy1pK30s0uYnwfQnwWPK1U8yeL0WmuTahT1TeIJuGxWsW
 reg2RlmSzx8RFt480vKUsClnt4XbKdiBk/RdQsAr+S7VvQFshSeZV3R4U8NbdWUTBM1r
 Lczw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTviAQk+WwgQCPpgf8KYlug4Lbxw7o0AOqTH5qUC0SQO8tsuletBE8F23p+nuzp0O1OvKVyWf3BjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTLGorbxCF93R09ikR8wScxZF6G1vv5juWqlN0I0IuI+JIkXHd
 o9egDOwPYVKo7tS6EAGDff2jZ5qWF5JVmtLHGz9IxSG+Hzg6Kebwqcigl0bd8ac=
X-Gm-Gg: ASbGncub0aVoKdgYQswONCwAzm6sbhkBgYK/ugC/nap5lUkQ0DC7h0ipkQBFfs3cnwd
 +9/GJL53hXxuWClUBYucqDW1/Uqcdfo66rG9bMNp4mTdvGAS+0zRhg9Hb+zeAVgEhpjWusrfkjP
 pYGN5hYhZVl/R2T2tWjCwjK4M4L5Tg+klROF0OpCLmvBatipl+6j/aXwGP3PZuLMk9982y9+d6h
 O5/FV21JKIsWRhXz4MzKhUDmSHJ0ciDfVl+m8qiNvObvpwdOofb8UW0BwLiVQaiyko7HpWsGxZQ
 E7Cc7NQ+BptyB//+DOE+FndRaPUV34jNsFg2VZv3k1zHeV9VBuILIO8aVMd2ChiR9XwSc5wEaWY
 ob/HgVA==
X-Google-Smtp-Source: AGHT+IFe8roSMzt3VVv7TZk036TpcSGcoxSHvfVATn8ZrfpARrpjkEuvUDMxx89xTrZ/KzUJppvbMQ==
X-Received: by 2002:a05:6512:104e:b0:546:2ea9:6666 with SMTP id
 2adb3069b0e04-54838f4e48emr8396425e87.34.1740477890594; 
 Tue, 25 Feb 2025 02:04:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b9e11sm136744e87.92.2025.02.25.02.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:04:49 -0800 (PST)
Date: Tue, 25 Feb 2025 12:04:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <uzrw5szojucylvminnxghqld34jez7lfzljtdxtkmkxtm5xodt@ruihfzdhkx7p>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
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

On Tue, Feb 25, 2025 at 10:30:26AM +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
