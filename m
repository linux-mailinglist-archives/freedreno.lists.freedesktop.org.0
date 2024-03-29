Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5389236B
	for <lists+freedreno@lfdr.de>; Fri, 29 Mar 2024 19:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A484112846;
	Fri, 29 Mar 2024 18:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L/KMipA0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644EE112846
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 18:36:59 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso2168673276.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711737357; x=1712342157; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aHkx7Y32QoW56rz0JNMHjO97URPHnDH9wV5JpFER38E=;
 b=L/KMipA0ZKsYYiZWJ+X4CwJcq5UpfOBbgXNrDY8jjiU7wjozmp1UKbN/+W6dYa2nf/
 Udg35jU66quSICQsTXBEi18lYL73t+KtUehkqnN6Gn+c1mZge3LVRcURXgv6bfsX62oP
 4ZRCENuu1StfZbiKki7OxteSHxPjpa520PIcQOIm9fKuC98XAWwMXW/C+e/J8r8Ua155
 vRrwMf77q+JGZrVLmknnE2Zzpxr4ShwpahFMPk5AFiFA/taoRD0E92+41/0sDnqDZonb
 +tPF+8Y+NPiwJLqSNZm1CBJRwfCiknbxpRH6t5UrBYIEmQMIDX1WGpA6MwvUhWrPev9y
 dy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711737357; x=1712342157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aHkx7Y32QoW56rz0JNMHjO97URPHnDH9wV5JpFER38E=;
 b=bruoamEi/slgo29yxOPRFHHHBki2pU3bvkgFe4rcfxj2pulMy/9zGge1DGAI28NNow
 yzmlU9+Qvxca4SpelxfocNo5ZCLrYFausIp8Lp58TDp1IdsphXJURH/PseieD3M8qUyy
 R5R57DvUjKnTlRJyg9G8HUunmBDEaW6VGS6JK58x2WSSUvBC5Mlywmgz99B+19LZ59yI
 ZAH2eeKHP8UDT6m9JM5N5yKvXXdkrqpH6PnPraY1HcokV4I9Pvb0OC4P99vVkJaS+0ix
 09DFCXs1NEjzYeJLyDEMWXjmYgaVofNzDh3LIWYnN0lbrV3Wc/k6HHBznsU5dUojvuUS
 tRPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSYJ4a5RnFfWq8UzyJI8Lpyr+bPyraYPS3uQH1lLfD1s3aIFmZ459DKP0d7iGHFO2qdN+5XI3jovCCngRvWQHrrjuG3DMaWwWWN5uK+NZV
X-Gm-Message-State: AOJu0YymXKa5p8FT59FRt7fk2cKi1NQCyWyRwRMZebPyFTnYHLK0cwsd
 kruFT+ufQLnL7d0LlTBFaNN8cEE7cKZS2lV0cEkaabf2ggzdVhniTR1c/yvlSkzf1b0rRHrqXtU
 Wz843kZ2KJ36jsk8QTvuQapRCxt4tM3l/0FHQJA==
X-Google-Smtp-Source: AGHT+IERevB97IF6pH84hlBH+caFIrkRJzR3o4Bk7fPLKGsiOONa8kVzkW96kXFtazpyF80yhz0+Wdm8wZl5aBtqr10=
X-Received: by 2002:a25:4903:0:b0:dc7:1d:5db4 with SMTP id
 w3-20020a254903000000b00dc7001d5db4mr2911776yba.34.1711737356997; 
 Fri, 29 Mar 2024 11:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <1711730896-16637-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1711730896-16637-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 20:35:45 +0200
Message-ID: <CAA8EJpppQSTm7fH5fUXef0gdc-+zeKfFGw6uF1j8FJqBMySFjQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: assign correct DP controller ID to
 x1e80100 interface table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
 airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org, 
 andersson@kernel.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Mar 2024 at 18:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At current x1e80100 interface table, interface #3 is wrongly
> connected to DP controller #0 and interface #4 wrongly connected
> to DP controller #2. Fix this problem by connect Interface #3 to
> DP controller #0 and interface #4 connect to DP controller #1.
> Also add interface #6, #7 and #8 connections to DP controller to
> complete x1e80100 interface table.
>
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Changelog?

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 34 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
>


-- 
With best wishes
Dmitry
