Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CEBA38D4
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 13:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBDD10EA36;
	Fri, 26 Sep 2025 11:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VT8V4wtB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F58310EA36
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 11:56:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46b7bf21fceso15527005e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758887776; x=1759492576; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ut9PX3cAo1VE+qoXsWqw/nQBs5+sgJFMGOIiq69Ad8=;
 b=VT8V4wtBA7DCZ9kUHB+xj95qcaNtKkKeC9MyfIP3+1Nu16exJfPrX4qaJFy2oZk5Sw
 JKSro8SjUoYYKbH6m7+9mV3kGjyo7caZq2TbaKs87FDX5LBqusJBzFHg/9npSelLuosX
 Jv7PXgX61HIsnAHlC2VqlqKFS8PQ0Q5uclDYxw/93LvbsXR91Q6E3Uunt7WkSauwXwQD
 ebBrfADqXiuKWJjRTe+pWoWBkPmsSVK5rm2QIRKr7iUJCWZzbqn22MegwHlqvfXVef7w
 q9tyaoN/WiymzceMIWZomrq5Zn3EuLaH/1AxQdgYoJkE17NVTCVk4LG6m6nBvlTzsIUI
 2nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758887776; x=1759492576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ut9PX3cAo1VE+qoXsWqw/nQBs5+sgJFMGOIiq69Ad8=;
 b=t4+HXASlrwx2NkojsqfyeAh+d64LKWTtxx/WG+WJ7mmW7jS30DMKhCMWlR9hvkQ7h2
 QIgPhSOoStVbmFe4iIdGcirm8nQQMc0Wm4//NAGxk4uEnBilBN4/3v9zpEzb4I//WvuF
 tiz0MGNwI+HkYObdrTRviGzKSojTvRXlOIF8dJHw79wxMhczyL9veIqvXQkkdMRxjdv0
 7l86kB0rXgNDE103NZULrUh1V9oWR+r/SUQFnMHkmcjENi9RQKdyc/oET/KYTkCiqBEU
 c8hFFhB8kMyNbzHgSywnUk8oyUBFIXry8jzo1ftHJ3PFDWy2qnlF9Y2fQ+Fw1HKtcuQC
 SM8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZcdJ0J3h/MTZRUqWvCUPDw+JD4iAca5miCLOCCN7O8gcKBbWZZHLOzP808mSMQzjme4ymAnMixk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypktaC4MbLNoM7F97UfAymNbnlgZkjBEbcntlawobv9UOBs4Tj
 qgpjGqSntjD6/N1cIZTI99s+77E5Cp/K6KxQBKiCJJ0JUX8+ZH3FMOGDdboKFBxNNLw=
X-Gm-Gg: ASbGncvGeGF80zBxRRJXqprPEBzC/xCJjEWpM+ZWAYYzDDjRe717e2CRI5Tqcvdf3AC
 jV0ZfQDN6MiNh58gp2L5eRmm7NzyRUtIzCMi2ZSeQLz5QIjc9uj6Git9HvxvMHlBsnC11jx+SFj
 vqvJjZAF5foPSaOlwrDXYmLemJV3fc3+0SIrcylHUdeytlF1gZvCJ+SbzpbdRwcFO6mRpNhqDm1
 MfBF1TvW4aK7xB2eetEqCzD3PkCTPs9nkBUcdIBfBxmUd5Wi4Qiy3lapZDtFPgvfKELbyLF7ohG
 Ib9iYSStwUkIX9xElj2ugMX3ibECgBiwgvCfc4JsKxNTbsZ4X35zrirjT5lJ8ZH6skQbXJHKCMZ
 xph04GgVgaGHZUjo4bwgHFw0t0KHwpYll
X-Google-Smtp-Source: AGHT+IEhOtwCtT7hGmRGCgAuHa3ZlRs8uxFPuN5Php6GAeEsMeg5YY7gRCrXkIv2ffaFf67OznqytQ==
X-Received: by 2002:a05:600c:1f16:b0:45f:2cf9:c229 with SMTP id
 5b1f17b1804b1-46e3292ea63mr65336745e9.0.1758887775546; 
 Fri, 26 Sep 2025 04:56:15 -0700 (PDT)
Received: from linaro.org ([86.121.170.238]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9e3bdsm77800905e9.2.2025.09.26.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 04:56:14 -0700 (PDT)
Date: Fri, 26 Sep 2025 14:56:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <lteybuylw4ejxsnqbyv5cyrc45od4y5sccg4k4nfjkzbwc4how@xd323dg6agbd>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
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

On 25-09-23 16:03:50, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Tested on Glymur CRD with yesterday's -next as base.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

Thanks,
Abel

