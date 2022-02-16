Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40A4B9144
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 20:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B69C10E3D6;
	Wed, 16 Feb 2022 19:35:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99F810E3D6
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:35:29 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y17so5687004edd.10
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
 b=OMOMVpSoOJQ54fMEuRukmDdSLLKh6/vsEUaz/TTeA/q0kDcXGMcglN/JS5LBzCX8Lv
 lmpYnb6FTlqbP97L5MeOKH4seXrJJZvQxfiDHYkIdrjRBTduDl/H35RJX8e4JhKcb22j
 8u0V3hJ4O23K2ze9bvRjq6uL7yKhYRpsOymjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI8joxrk1YyY98A4abN1SonGW2lvV7xnuRU9NFCob50=;
 b=Unbgp8usJQmWFFoq+YZAlUEfMURw0GUIdX3BtgwhGVT37DrNXycpSUOSxSw0Skzdz4
 rRO54qR4zjOeXrPPbus1u0EADCJjm+q6aoyX/85OgNmGGr19nD3q6Ot8JhH37KhXxMcE
 9hHQucIOxw7+WJ88oa4gKruN8gIjGbPl4eGf5Yu5a5qa+SeUGsKG8r7jMc6DKuNwJcXv
 OJshBf+Ir9P2Tk2Fv+H6NeEHW+hU1SUBvpva9clNV4fPosZNRdEo84q4dIWiSVn6filU
 nRLHJWZekQ0yVbs5sJgljdJAOX6B4UmP4HXXnGREzpoL8eStmf4sqL6D+Zkx9++OofvO
 f3Xg==
X-Gm-Message-State: AOAM530WzP+0EjL6bp2nJ7qIpMc01BiOvP4X5g3WTUkWBWtuB70+XTck
 5XvUCAK+tGb2ttvcxXmxbVpMaocdkP0FBGCIcsE=
X-Google-Smtp-Source: ABdhPJwAg5WyYkLD8iCVsDjauhHc8WdtZCtDAydHlAWqnIJl8lJsZsvYZ23DrJrsq5GpiBOCa1yzRA==
X-Received: by 2002:a50:f686:0:b0:410:e352:e61a with SMTP id
 d6-20020a50f686000000b00410e352e61amr4572298edn.23.1645040128219; 
 Wed, 16 Feb 2022 11:35:28 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id s17sm282591ejm.17.2022.02.16.11.35.27
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:35:27 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso2383339wmb.4
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:35:27 -0800 (PST)
X-Received: by 2002:a05:600c:228e:b0:37c:2eef:7bf with SMTP id
 14-20020a05600c228e00b0037c2eef07bfmr2876839wmf.73.1645039773639; Wed, 16 Feb
 2022 11:29:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:29:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
Message-ID: <CAD=FV=V9vXbvuU5oK6maXKAfzEPzT2Fp5Vf3CUqpJvmM+wrjeg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/5] drm/panel-edp: Add eDP sharp panel
 support
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
> 35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
> 35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
> 30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
> 90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
> 00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.4
>   Vendor & Product Identification:
>     Manufacturer: SHP
>     Model: 5411
>     Made in: week 53 of 2020
>   Basic Display Parameters & Features:
>     Digital display
>     Bits per primary color channel: 8
>     DisplayPort interface
>     Maximum image size: 31 cm x 17 cm
>     Gamma: 2.20
>     Supported color formats: RGB 4:4:4
>     Default (sRGB) color space is primary color space
>     First detailed timing includes the native pixel format and preferred refresh rate
>     Display is continuous frequency
>   Color Characteristics:
>     Red  : 0.6396, 0.3291
>     Green: 0.2998, 0.5996
>     Blue : 0.1494, 0.0595
>     White: 0.3125, 0.3281
>   Established Timings I & II: none
>   Standard Timings: none
>   Detailed Timing Descriptors:
>     DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>     DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
>                  Hfront   48 Hsync  32 Hback  80 Hpol N
>                  Vfront    3 Vsync   5 Vback  69 Vpol N
>   Display Range Limits:
>     Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
>     Display Product Name: 'LQ140M1JW49'
> Checksum: 0x77
>
> Changes in v4:
>   -Add all modes from EDID
>   -Provide EDID blob
>
> Changes in v3:
>   None
>
>  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

We want to be moving to the generic edp-panel but even if we move to
edp-panel there's no harm in supporting things the old way, especially
as people are transitioning.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
