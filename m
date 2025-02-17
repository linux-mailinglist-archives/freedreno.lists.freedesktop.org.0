Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBDA38CB6
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA66910E5C4;
	Mon, 17 Feb 2025 19:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOtqvTlg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B43610E5C9
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:50:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso5080686e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739821834; x=1740426634; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
 b=hOtqvTlgOuB5eEzGnfGyrBo+XjrOHkKDX5UVAWDoH9WkjwhxnNwskhLQZBLwuiUzJc
 KkeGEtBp5TP12XFES3WkOpzOUPs+r1eL10mTq0iBdBie/+SXEtWBnJNmUm7uUMZ+tMV8
 xIcPW5v0xUNda4wfVvWwz8Tx7g3qnuaewYzXQBwyLOaqjX0xd6bStkM3jzkJRY9K0Zt+
 N0pJDhU7i67hXMu0jk6NsVc21zIk3H3HHawJpwDFCAPS/6zr+6Nb5rjXZ/3mPJMwKb6p
 uRgpqI1WjVNDDkF5QAHKgBwslnkAy1mPrKBDhvBzDgw4izOjJAdwy/3sEy9A1ssZ1hkk
 6eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739821834; x=1740426634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7XMMxmB25I7aAKLMKpG9EtSe+ebYBtU0fhxbENZPlY=;
 b=DjeXS411j2NSrMAQ9vkdRQe4lI1npbxRT04j7xF9NFeSVfUCvIxxWlNH7ixupM+/E5
 aLg/WeuehIcWadhfvQIXvPyum2wna73NLkJXflkDfo6c6uPUujovs/S1ipJJJ4ME1j3N
 uWk1pPMWAfZFmxJn/S7JChIgfePoea6TfzZAcHViOja4Nz6fR2IP0XapoxHevdZMi7op
 Toj+2pvYd0L2NfwOIgcP9HRq+vHXM0wpYOTx/fIt6AooYuM+9ks4w86uWCJWClncnvIg
 gBbczu4U278GGAIYTJ9Rc3Q2h3BM1ooOPT9k1m1NDwY1FgXbUEFi0yOTJ5kFlD4BgXSw
 4uKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTK8+oRzriuEpRcGI7PkuENQdnbK/kWdMtFlP4Jfg+2F94polBFtD6g34wOpKI5XCmIb1KYeKfp8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvcOqtn39mIAikxi5FBGVINuS0Z3kTRbdvzkT3Gj5JF0bI0ZRr
 62sJYy36UcJ+31o0oqvM6xjmS10gpWGr5HtIbtO579ydWDSrCBUiwwDfusKHjGQ=
X-Gm-Gg: ASbGncuCHcN6TX9eT2W/d0m6OP4ePa4YYuL2JNq1+TtsVqJtmarSy17FhHkpn/jlYTW
 P2WB+0Cm3apD4dPlezttlF9AvmlgvdCfePo3W5n5zLwOBaAHOkS2Vrs3rUqSqSfNUIf+yAkIzF0
 weqrruTZ4bJyj/PK9BBm8RcAIYdGK6EbFd3tYXPmQDB/IgDl/jaGu9TDUH1LRa4M25OLeOBc+1B
 07aRU3IVkngwaVWwv44iJZNHvMEt/uN1wKQn3ryt8AA+7nlDzfuOf/Q/SdEHdYcsr4xx4Xcsdq3
 4FfT4vcsc18sezA+NxssayKuFozhoT0hJpq3xIlXIpI6Ebf7snbe2TR4UgXemu3J0sAbwOI=
X-Google-Smtp-Source: AGHT+IFEnXuT2usVcSoMTmal4BeyQztiA9BaCKYabRMQm3dIpVeX4YHZzzAuOaY3bq5cOJl0zMdGsg==
X-Received: by 2002:a05:6512:1194:b0:545:ff1:bcd4 with SMTP id
 2adb3069b0e04-5452fe2e442mr3602142e87.3.1739821833664; 
 Mon, 17 Feb 2025 11:50:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54522858229sm1504623e87.4.2025.02.17.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:50:32 -0800 (PST)
Date: Mon, 17 Feb 2025 21:50:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/15] drm/msm/dpu: check every pipe per capability
Message-ID: <sd3u2l4epms4ttytoc2bqrzsqfxnphqkutwkxremjon22ven72@3rohlpaxhryr>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-1-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:15:50PM +0800, Jun Nie wrote:
> The capability stored in sblk and pipe_hw_caps is checked only for
> SSPP of the first pipe in the pair with current implementation. That
> of the 2nd pipe, r_pipe, is not checked and may violate hardware
> capability. Move requirement check to dpu_plane_atomic_check_pipe()
> for the check of every pipe.
> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
