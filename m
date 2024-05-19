Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FBC8C93FA
	for <lists+freedreno@lfdr.de>; Sun, 19 May 2024 10:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C32810E191;
	Sun, 19 May 2024 08:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tfaNme46";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB02410E191
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 08:32:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e576057c56so20679291fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716107545; x=1716712345; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8Le8VTSm8L2eQLV/FvTpqReYtFhrZrNh0lNICrrBekA=;
 b=tfaNme46wJxYZlRI5pRviu9m73T3Q7Bylhn5pCreIWXfl0jgdbTUYeGIkOkIREzBGd
 bJcYJryDy6rpLXq6kUcHfb7U+dFFB1Gl54ZNvT+XNo/7FBtVrc25T69zHLbDXorLw/T9
 rpcTRslxDVbOl1A9q2fLcIHZebkGB833C6cI8h6SFwaPq9899in0k4JiwYmHDsVZ5Zz1
 qsxTeNajwMAA4KkE1ZCrtJ1vXe7GVLPRT2kmWGxTZlhCKOtD+7sEtkWH3hxa5NUFwnfE
 YtmkCu61+lKOCZCeHtGdLM8J69CvrVwBeFjyKzSJXcrtZCVRfOfVerl7bMESUqUdYijU
 mU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716107545; x=1716712345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Le8VTSm8L2eQLV/FvTpqReYtFhrZrNh0lNICrrBekA=;
 b=KdV0PUu3BEWHs3YZoCjxTh5s3XEDZyJhQnvqkiem0t+qML4Lo5VyeJDMsX+dwh1cab
 vIhDhqeFF3X9PHVtGl6HNeS6m8oMIQykHhpKR7LF9SGzZDfZTZz3AX+WKmbhVH2zfNxG
 UHheTMBlKu77UpeEBBKbmF329UV/dNepEBoz5wHaBvR4nR/ynrGWlP37GjnW8TnSr0bI
 mAM1Wb0n7HqwROqdxyWWDN2+ald6ZcSWAyAmu6w3pA9N6E/yKJFCIju1AXc5KRqwRJyC
 bE7R8bErVBXplOfkVFZmX5I5bDPvuCyz+W3MfcGtg+0Y3XvKi+7hTy3N2rgfIdSMp886
 XK6g==
X-Gm-Message-State: AOJu0YyfT5MeE/ADwPaqVsJuVZg1pCe4RwHR+J01m1zUboebJRlRQodH
 JByhroq84KlZime0t+FZhYWq7oJSfzAV0zsHx32LS2ADJhYN2skn+wraGnFem5s=
X-Google-Smtp-Source: AGHT+IHRQAJTuuhuKf5V1fqci/B7pNsDW3WCJuXKkN6dOU9qUhabV6ERXOSUH7pVZKKxAmR7LqidOQ==
X-Received: by 2002:a2e:3c1a:0:b0:2e5:62e4:33ec with SMTP id
 38308e7fff4ca-2e562e434acmr147040561fa.33.1716107544823; 
 Sun, 19 May 2024 01:32:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e52ed429ffsm27370571fa.54.2024.05.19.01.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:32:24 -0700 (PDT)
Date: Sun, 19 May 2024 11:32:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] drm/msm/iommu: rename msm_fault_handler to
 msm_gpu_fault_handler
Message-ID: <ekfam4rolj5ouctytp4srq2iofh2ih4spdic2r4ffvjjawenhh@si37t7k3lmkk>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-3-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-3-quic_abhinavk@quicinc.com>
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

On Fri, May 17, 2024 at 04:37:57PM -0700, Abhinav Kumar wrote:
> In preparation of registering a separate fault handler for
> display, lets rename the existing msm_fault_handler to
> msm_gpu_fault_handler.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
