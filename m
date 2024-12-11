Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1E9ED851
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 22:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5E10EC17;
	Wed, 11 Dec 2024 21:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="L1swpjVG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B53410EC17
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 21:19:33 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e399e904940so5613151276.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733951972; x=1734556772;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=HYpTBgw49iGGQnoZixVyDOp+jWreZ3c1N/xlRY2EXfY=;
 b=L1swpjVG3QVuqiSH8Jf/qaeqoobJTCWeJOUnpKe+78tkhQkz3Jl73F/eCx44iOG5uc
 t/Z7SN8OQruUNIT0sYFiwIzZ9JfL02DRKSbj8y6B5aAPO2vByU0TwyL9L/yiz3tha62A
 PeD9HLs0fkASwRQSPRkaj4lWYZSijIhDy83+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951972; x=1734556772;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYpTBgw49iGGQnoZixVyDOp+jWreZ3c1N/xlRY2EXfY=;
 b=GggHiFXBg9/rM8yqBb0rwcT4exVchRoS3j8stBxvK4O8Wdo8Paleg9mv7TbiKa1G9L
 VYlPOB8Zo18LtIXRvx58lHOmjRKXx98v/ZQCfDTxFfRlXwEFPLCAAxYSMw/sPx+2CLI+
 CuOs4qlIpD/UIB7UK9NxTKTrnd4KB+VV/X9S93BIe6cjj8h61b4n6NXsgoeXGgD3Dk9k
 pjdaM0ng6zaqd20DrXsscw27j2YHZHfUvLsyAbrHuuoyPMxx2XoXpMyfOnBRxxGw0GFR
 +yIbJiTC3aUGR9tNHj2IA5o7jvN7FSq88p/ryxvuQ4hi/BzGxs+9ieLaCa2a0hMMnwjd
 pN0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqYKp0Knhh9M0iTbhX4ZeqC0RGgQsxlsT3TSw6EmBpERWF+3mT5k7uBmS8ay0yjfOYPP0cBltw4Uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdnmZbCReYBFdlfW9OA9kNKuyeKGFbmB4P8ynlXBFaPb/xwVxR
 f3/fu5JBvrP9ELiTto+UGMfbomuiNO+EZS+tqC44QZnPth3UtQJ8K06x0qA5fW55+s+OFvtMXGH
 RX8YGFyk6I93zKM80a2EF2FMjU6M9o5+k9YO6
X-Gm-Gg: ASbGncuJVJ8Km+/AIVf17BxcsWt9AkmpTUhhNA9y2o/tbqToclYUKdIgVnpegZGxXQq
 sdt+4uWDFM01LhWdMSva6+GuT3YMLPX9gJuSrRCLBvJURiAXQmGpuk0N8+Hh5lAU=
X-Google-Smtp-Source: AGHT+IG0n1apsTNyaVMm69eKfJ0OWmTmr6rAMEZdQLhM95ckH8dadOxw475UNN17L54dURE+0mDPgl6bERAbF28z3lI=
X-Received: by 2002:a05:6902:2709:b0:e3c:9ed1:4944 with SMTP id
 3f1490d57ef6-e3d8fb607a4mr1059614276.1.1733951972207; Wed, 11 Dec 2024
 13:19:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 13:19:31 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-1-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-1-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 13:19:31 -0800
Message-ID: <CAE-0n533qmCvd78GncN=cEkYqvfQ8ejs3xr7E=ucUJ8SqfSeDA@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:31)
> Rather than printing random garbage from stack and pretending that it is
> the default safe_to_exit_level, set the variable beforehand.
>
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
