Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061B9F8784
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08B210EDF1;
	Thu, 19 Dec 2024 22:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tu0GyCnj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C654D10EDEF
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:08:51 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so14544051fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734646130; x=1735250930; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lyeuu4LJqYXKJsxeS5Q3cWA20lIzMdu0VE7mLfNw2CU=;
 b=tu0GyCnjSJRny1L21s+9eyUV3LG4Rm6DglXXWGBQ5F06i5QIf/n5E173Pgx+LwoXDJ
 NI4Crrs+KaChZVRYWOq4rYZj0CoQ8ZSRdey8jOXut16eO3LR5IDmLJi9oJfdiNeTZvXv
 YI2K3ZMSpufqCp5lsNd31MU8HT3fZFnDzA5ot1bjkHkSdGrjWK2kKy7rBEE5+Ra1XmVX
 7Jt9nLjkex+lmrMOzeL2N11r5X9xX+uCAGhg4OzCYh948l91cESTOrgCz1bMTmWh4kqa
 d7IzvJpxrUkoL/X0QJgZ7OT30ZNJoFP31QeUpcqXLkUPJ3+v3Jt6Ofwa/p6MJzdyqsBj
 LmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646130; x=1735250930;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lyeuu4LJqYXKJsxeS5Q3cWA20lIzMdu0VE7mLfNw2CU=;
 b=W65NiRS4EaSRxFQGmRMzG1e4V0YUt1dQPX++Pj3T+ivQeuZc3wPhpDCgEAGb7LpQJt
 Z/KUQ56AchXfkoSMBQw23R5Bzc70nLRmFZSAhi8unpbTFgzGtQPdkvpTNU6TUwCQQ4lM
 GrKtrboT4QkPYl5b4vXrlzORZtN9noq7Ku/4A1ftE0KXrQFeImCwXtbL3p4Mtsav8p5E
 f795uiTM6UpSZ6UxJVwAUcNYzhkMBD7fYrksiS9qace/I0bYmoWr9NQGj+FrItmR7IqE
 I8I6Dbb1yaKX0onEV7sjrvBgnXrlSZ+p/V3TlYBOaVRh2CYFbzOtof6KsHIVWCzP2t0S
 BiQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVsBj+mZS2jRMm+T4VM8yCNRAypxGGyFymL2qurBYBcWfcVNBRBAxdSPhzF+pb4dR85jE6pL+i4YA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRCU4ZgPS6zeS3HJhjUaZMJwLWoHrIZLLjORMR4K8jLsxFAq3q
 LCPjmJykhTguwX/izuK9PwDiTsSL8v7wQeu2UG953SK082xzNBIiOeK4GWCmFbk=
X-Gm-Gg: ASbGncuYVoqLCDGcgeIo9ljklpATnh/aIS+XwJesCOpGB7oYboCYHepcbhbnNlJLUf2
 VAvar7uRN+W4+7JWWM0j0cNxsM2D0JMJ2l2fvjt9ZuhcjnIHMCrBFAGIy37xcOdcKawe7ZC4Lxf
 obXlLocZilqEfXG7bWlrdLiElH1FMCn6BVbS/n9yPuQdogLI96/lh2uBX0zmMtRpxZP6oQNv62N
 DtVtdm8rW9CPzq5507sl6S38AbE7xAUD6MH6Nd8Gi7hWFqaMHsAuT4e8UwBigDVUsoBjog7MAIr
 VU1WypfmVcgpDpoznyd/Ons84nCFY/D2bqaG
X-Google-Smtp-Source: AGHT+IFcKO6Ujd7CnRHtc2hk0H7VRIDZhLYKvJDcgU5TwaYIn+ZggfF2HvZKmWqnYi29uXRcJLKjLw==
X-Received: by 2002:a05:651c:4ca:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-30468571039mr1513771fa.19.1734646130072; 
 Thu, 19 Dec 2024 14:08:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083b4asm3402501fa.112.2024.12.19.14.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:08:48 -0800 (PST)
Date: Fri, 20 Dec 2024 00:08:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: Do not fix number of DSC
Message-ID: <p74ehs7qyfcxh42h7245vebbkcdhy3vfkbeo3dno7judxv5xpd@l75g7pzpc3vt>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:19PM +0800, Jun Nie wrote:
> If DSC is enabled, the only case is with 2 DSC engines so far. More
> usage case will be added,

Can't parse this, excuse me. The patch LGTM.

> such as 4 DSC in 4:4:2 topoplogy.
> So get real number of DSCs to decide whether DSC merge is needed.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
