Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8136393EA54
	for <lists+freedreno@lfdr.de>; Mon, 29 Jul 2024 02:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3906C10E087;
	Mon, 29 Jul 2024 00:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VcbaBksO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B010E087
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jul 2024 00:37:53 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-821b8d887b8so571776241.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Jul 2024 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722213472; x=1722818272;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
 b=VcbaBksOAF9j3KZcpFs2lHBYoIqamrpNUcTp+LRMy9d8Gl7UfJSzpM4OnK7mOOeu79
 y7FbsRi13DC94LHcLGjvG5t6b1A6LLK+I4xXZML1bBYB6xk+gnJphbrLGuOqw+aomoZi
 MPZXFaStn4jS9HI9ONhqEAqRZQ5irdFnVX6p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722213472; x=1722818272;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgeSIz+XfbTtXVtUjbJV2VQHBXpmwBkdKyJpRDYLYhY=;
 b=qZDrjWDuLbl22JH0AOTIeAnT05qF+NBAeTMI9eSZeoM2Ud3YaT0XIg094MWN8Uxkdc
 f/gG0RpZgPlozkDsFxAPg10CAESNqwPynw96kdu2e75egUbqkJ6zeOFyiWw+cvX5pmVn
 xxBvkRImqPNtujvZInjARVLeq/wgDHD8BO2Ph0vdBulZwkrAzujV8pBwqg6RyEn+5SNg
 xUfKIqbAbqCNbACoVFcQL7jj6Z7x4L8g6IMUtn9ixn9SYVVLZHpsKc2+2Mt5TpqMmPRY
 ZPJX4bAB9t21bd3GCKPqkAqCCQqnjIGPhMG/+8i4GRFWEoaTWgK926r5i3LELJLepJaP
 XR0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBUAz7AA574Yt0Uh+jmJY5oec1PMzUMzt0Ipcn/PKpfyjMbtxr9msbNWpXTY0WpSE75knn4dFpL3kHCm59iY1EfbHka/3UIwZV4NOqodxt
X-Gm-Message-State: AOJu0YxXN8rZCE4IavJIQReFfx+Jnvv7BU4q6Odu/8aOT3Z1CPkN/xx/
 5/t247UY1jbbjKPMO/cABbsjrApdNOqq8Z0ybF47E6a0C+biIy/SNpIDiYuSsJic2N+Weo5CZi1
 9cNXrXy+XmP/ZdSmg8nCWDwU/wVAkJDV7aqIs
X-Google-Smtp-Source: AGHT+IHnc0qYQ/QNoYPa3JLfKJgzufSGeqO7zfkvsDu+SwHrgNq6HfC27UO1CGigP8NDR74vS4JR3C3+McMA5IKTJV0=
X-Received: by 2002:a05:6102:3e90:b0:493:e66a:793f with SMTP id
 ada2fe7eead31-493fa4594bemr3339662137.23.1722213472288; Sun, 28 Jul 2024
 17:37:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Jul 2024 17:37:51 -0700
MIME-Version: 1.0
In-Reply-To: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
References: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 28 Jul 2024 17:37:51 -0700
Message-ID: <CAE-0n52kAq4=Cbdjg8JFVJ9a9ww-cLkUwcJ4BNBP9McXeaSxeQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset the link phy params before link training
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, abel.vesa@linaro.org, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Abhinav Kumar (2024-07-25 15:04:50)
> Before re-starting link training reset the link phy params namely
> the pre-emphasis and voltage swing levels otherwise the next
> link training begins at the previously cached levels which can result
> in link training failures.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
