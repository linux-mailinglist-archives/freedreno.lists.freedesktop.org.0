Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21180E462
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 07:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2398110E120;
	Tue, 12 Dec 2023 06:41:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B810E120
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 06:41:40 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5c08c47c055so52352797b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702363300; x=1702968100; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
 b=HuW4rS+NYtMljmLag74OkaQ8Tl94bEydGv+k0L4VoJcbw0f5RngsvlYVQK//+Vd8YH
 GSpME+R6wWJFbmiL4lqMtpMljAXV1A+SeFEWWl/nClFcAMjwjytOrbruJ9tPbE7d3jXz
 7On2vPguCqLqdYkccAdWjYi3Iur/OFBo82j2J/9t9fyHggDjqtBPq+Of+G7ucAMhvwT7
 cc4s4qMyAduanShyQSs2pesBhFn6KE/S5XgdsqZOglDG6K27B3hUnrH+n8R2IWUvldHS
 lYg+Q+osQnY18tNN/34ATu2+MU4oHO9ux9ciVHBnSSb1YORJMG3tzBf0Ty4ffSBFpVP0
 j2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702363300; x=1702968100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKE2zuLzeQJDcIXSdKzo06j4Otoprc4M3hYEaOW4B8o=;
 b=tJ6G/2AmzKBh0udcDQ3NSiRzaQHWlADgNtvYyahPVKzjUiqkSEs4mZ/ZKIcVsM2o8P
 i4LHMR2WixpybzzRPqU43Gkx+yJ86Bi7YBc0ZK5Siy32ljF7jffbDEVT1mtK3Kll/+iW
 nFsnstFy0TmLVY8viKpVfAPQ3qFPtP4ZRr0iFb+zeV9JaXkjhr12s2eK6bGwg+I39MJn
 wfr521PCxK0U1RPXzFWQrBahmBBvkd1NkQksrz5L4ex/oghjeYJ/OHnrpGKPrYLAu35J
 Q7ZQGG9k+/bBBiIQjCjciYFkbx57lDBUMcB0icV6G58pvpt1NvMYLT1yY+an+YGPECHT
 +5Nw==
X-Gm-Message-State: AOJu0YynYp1JBUNmlLej2mHY+6IU9AC1TLqeiX3w2D+yZmce4/3oUZ7J
 S3un6so5PyXcwnL3iFlW0f26hMAHrc+Y2OaC+mGJnw==
X-Google-Smtp-Source: AGHT+IHm3Elev5sOzSSZwb12FUilvp/T+04Oo2vDTg0/IFFD3ZcM1sD3HEd7qlZ80V9IQ6FD9RbDvwFmQqdbl1lMypM=
X-Received: by 2002:a81:8585:0:b0:5d7:1940:53c7 with SMTP id
 v127-20020a818585000000b005d7194053c7mr4579131ywf.63.1702363299778; Mon, 11
 Dec 2023 22:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-5-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-5-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:41:29 +0200
Message-ID: <CAA8EJppjMhqJM8svtFECPJHRYvG7uSY6GB=Qe04q4hCQRNQZjQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since the type and usage of CSC matrices is spanning across DPU
> lets introduce a helper to the dpu_hw_util to return the CSC
> corresponding to the request type. This will help to add more
> supported CSC types such as the RGB to YUV one which is used in
> the case of CDM.
>
> changes in v3:
>         - drop the extra wrapper and export the matrices directly
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 30 ++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 31 +--------------------
>  2 files changed, 31 insertions(+), 30 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
