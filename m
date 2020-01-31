Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C18F14F4E6
	for <lists+freedreno@lfdr.de>; Fri, 31 Jan 2020 23:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB96E6FC52;
	Fri, 31 Jan 2020 22:38:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917C6FC52
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 22:38:28 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 73so3186202uac.6
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 14:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
 b=n+bPBIjWQxxmXcyNtF2EyFmopFozDQdpVp68Vj3mgGrFckg86ApNTNEWR0uFO0/7DG
 vyaxvdDQ9kAE++SLmKRA5v1t6u/ZjszK4NJAbdXgkmSgqli8p4OjpqQKtuJ6Scaf7brq
 ZmpnT/9SmPlPX8EFH7dJW+bzBbfm/BGo+QXbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
 b=FgriCu3YdxYFqMj2XfG69Tr6AcFtxDTKU2AumTz2z/QdEKPq99q+0AMafJrHbm8p8U
 qLh3xNB0D29pwt6vRQcOcyhiQ7ecOATgEBu2YWs/YYX9th3gsRSN72chawa/4BcpRQrm
 MivVLF+nwJi5Rd7S8PuVOi9lubFCZhGpMUcuWDuBInl/j9TsJe52MhUJgzazOY8y8CIZ
 PKPsKQ8ZtISmMYfYuwqXer5r4hfnIr2nHIFT4/JZrE3zuPFy0vm+5W+RcSiUyzgixm2d
 bUjqU6YUsDHheNBn1cgPpI5OdrM8VuR8ewbZnvgyPZ7tiKe8LOhg9Q0AxL+ZKR/ZLdvT
 cLgg==
X-Gm-Message-State: APjAAAV5ZU2ryfEPGDlNRrJefGORYsoM56Xtp4QlLO1fLn6oSKKEVbuX
 D2+rRB4dAFQKeRJgGt1059Zwt/VCJE4=
X-Google-Smtp-Source: APXvYqxotvTIQ5W6kSGI3dxa+MKfgSXsuBMWEDYYBa7nWB4gxhqCtNGLCruquOuw5Cz+iVBf+oe6Kw==
X-Received: by 2002:ab0:2745:: with SMTP id c5mr7858600uap.65.1580510307455;
 Fri, 31 Jan 2020 14:38:27 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id d3sm3067223vkf.2.2020.01.31.14.38.25
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 14:38:26 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id p191so2539952vkf.8
 for <freedreno@lists.freedesktop.org>; Fri, 31 Jan 2020 14:38:25 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr7858217vke.40.1580510305500; 
 Fri, 31 Jan 2020 14:38:25 -0800 (PST)
MIME-Version: 1.0
References: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 14:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] msm:disp:dpu1: add UBWC support for display
 on SC7180
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harigovindan P <harigovi@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 23, 2020 at 2:19 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Add UBWC global configuration for display on
> SC7180 target.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 58 +++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)

I didn't do any sort of review of this patch, but I can say that
without it the screen on my sc7180-based device is super glitchy and
when I add this patch in the glitchies are gone.  Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>

...one note is that the subject of this patch seems a bit
non-standard.  I would have expected a tag more like "drm/msm/dpu:"
instead of "msm:disp:dpu1:".  Presumably if the maintainer cares when
landing he/she could fix that up, but something to think about for
future patches.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
