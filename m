Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDE694EEC
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 19:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618510E68F;
	Mon, 13 Feb 2023 18:11:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8A10E68F
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:11:31 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id j5so4966202vsc.8
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YhyueGm0rbJoXfAMuP4ME9y20a+9vEsRucr9LaCFZhw=;
 b=SVjPeLrC97MbzGve1F6WSqRht948tpI14Bwxv9/AJydgcsAhw641XoEX6j3j67NsS1
 IqGHj2wxZY9CTt0ZEHwT/6H31umeLxUHTwMStANUidaIIJWsfVUYlK1ANPNyXd78J+2/
 3mTe11CYF/HJ2JZj2tLKeCcpP4i6yRbjk1wMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YhyueGm0rbJoXfAMuP4ME9y20a+9vEsRucr9LaCFZhw=;
 b=TVu/dUGWDUHQH8HRtM0jmHFinW1hMGwp+EYLWdNDcdUhqEa/4feI26ilY+PcmCwb+v
 z3CcqICm04zN2YFJrQlBn2RXdI7ldCpaDBOd/Z48w3bAa1A2luhpIcQ1EAHbAR2+O6FA
 gMzxz/V6eR0h6mgx40wD4dt0b49CFDLVulCaqaRHoc5ij3lqivk4ZtvbrOHWGx+MGSBh
 5k5bCbZKan8lAzkzxN5RDRjp997aGO049ggn2OFTidPBfTAjA6xUx+bsdJFb7mhzkxRn
 Lj1/FcjtDHrRLwdLfQ7veKUGU8B32K+y5HiTqB50he9jhpV57fVhpjOh7oGFa9vPw98f
 b2jQ==
X-Gm-Message-State: AO0yUKX8mpD/qN/BBLD7cJih0R5UQ+vEEgWtWXCwU4ywikyYhrhQHW55
 gmscAAF8xcNbfwNAH80lKgAm2LrNYLAOq7gH
X-Google-Smtp-Source: AK7set+qwfVHXEesD+jePP1w5lAF9H4FvY0mZ/O02Ctxx3SjpgNiSaMfsb30SwQeOV0R2XtB2cUpNA==
X-Received: by 2002:a67:7287:0:b0:411:fa78:e296 with SMTP id
 n129-20020a677287000000b00411fa78e296mr4099555vsc.17.1676311890699; 
 Mon, 13 Feb 2023 10:11:30 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174]) by smtp.gmail.com with ESMTPSA id
 q19-20020ab054d3000000b00635d22a2fa5sm904231uaa.36.2023.02.13.10.11.28
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:11:29 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id bs10so6692101vkb.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 10:11:28 -0800 (PST)
X-Received: by 2002:a05:6122:243:b0:401:4f4b:22c2 with SMTP id
 t3-20020a056122024300b004014f4b22c2mr967178vko.28.1676311888469; Mon, 13 Feb
 2023 10:11:28 -0800 (PST)
MIME-Version: 1.0
References: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Feb 2023 10:11:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XKOm1zLH+grTMD33QX_uX67AQ1ZUoyCYoAfUpqktCshg@mail.gmail.com>
Message-ID: <CAD=FV=XKOm1zLH+grTMD33QX_uX67AQ1ZUoyCYoAfUpqktCshg@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v12] drm/msm/disp/dpu1: add support for dspp sub
 block flush in sc7280
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 27, 2023 at 2:15 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
>
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
>
> This change adds necessary support for the above design.
>
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
>
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Separate ops for the sub block flush (Dmitry)
>
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
>
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
>
> Changes in v5:
> - Spurious patch please ignore.
>
> Changes in v6:
> - Add SOB tag (Doug, Dmitry)
>
> Changes in v7:
> - Cache flush mask per dspp (Dmitry)
> - Few nits (Marijn)
>
> Changes in v8:
> - Few nits (Marijn)
>
> Changes in v9:
> - Use DSPP enum while accessing flush mask to make it readable (Dmitry)
> - Few nits (Dmitry)
>
> Changes in v10:
> - Fix white spaces in a separate patch (Dmitry)
>
> Changes in v11:
> - Define a macro for dspp flush selection (Marijn)
> - Few nits (Marijn)
>
> Changes in v12:
> - Minor comments (reorder macros and a condition) (Marijn)
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 49 +++++++++++++++++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 ++-
>  5 files changed, 58 insertions(+), 7 deletions(-)

There's a (trivial to resolve) merge conflict when applying this patch
against msm-next. I dunno if that means you should send a v13?

In any case, when using this patch together with the DSPP series [1]
the internal night light works on sc7280-herobrine based boards. Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/1676286704-818-1-git-send-email-quic_kalyant@quicinc.com/
