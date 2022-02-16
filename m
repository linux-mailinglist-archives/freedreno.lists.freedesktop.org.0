Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562954B9133
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 20:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDC210E3D6;
	Wed, 16 Feb 2022 19:32:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D201210E3D6
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:32:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bg10so1599683ejb.4
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBTCqD8W3d7/1ezQ2LdtCzAwaR6pXiQgPpkFprvW/Nw=;
 b=NyQGHLpcNJ66DePae6L2lXAF+RjeApP9G1Gfv+lxQA/P/rp4h5Tv/Dd68OLW5zUl85
 t2n4nl0x1bpUqIy6o2kASPQD24zOIPzswv+G024rhC/nWtWXv5KgLLsVt7hboPwHsvfM
 sRnwu+n8kjGWUn04zttiFAjNSEcFmNcPt3E/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBTCqD8W3d7/1ezQ2LdtCzAwaR6pXiQgPpkFprvW/Nw=;
 b=JtalXYZ8ryHpOsr1STTR0RszXNw3cg934U7ptnepJRBVmhKPSQ33gVuZhum2wUo5fy
 9W/T2K/uW/P328iKAdm1t2sWteAMEcAEDGwq9BEB5Hqjm6kp4hAeJSE7B1WSQx3+pk4p
 28w41Oneyo3enAVDs9+Z3up1t92aje6TkfF89/Sh0hi/CKP+fsDRZ5ZzCxRvQA0cNbHX
 /Q5IsDCqACZmMyjeQ1Yv3bsoQfm8Z6VqkHsHUXsr2L9y7ubrHSTWz0xKNpKtuKQpC1fZ
 KtY6Esv2ozZFU3+pO49YwmqQ57PWk+eJu1zmQFX1gWXcBXxy8+JCEyNmRcri50r1zh80
 q0Aw==
X-Gm-Message-State: AOAM530CW2SYtoOgXGGP9kvhh4D8qszJSx7UEAuHC5byixfeEx+VfWFf
 Q8Q3txYZyYrsdhbM1UaEu/YSMfBvxZlTVl7Wap8=
X-Google-Smtp-Source: ABdhPJzcSKj7y/pwIl6wffC+9KdfZjT7g631qyPZHngMPjexlWULu5VyWI0i1vINx3ygBTvTXVTT1A==
X-Received: by 2002:a17:906:9c02:b0:6cf:93f:f781 with SMTP id
 ff2-20020a1709069c0200b006cf093ff781mr3346986ejc.312.1645039934109; 
 Wed, 16 Feb 2022 11:32:14 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id z14sm2193545edc.62.2022.02.16.11.32.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 11:32:13 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so3024148wmb.1
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 11:32:13 -0800 (PST)
X-Received: by 2002:a7b:c938:0:b0:37b:fdaa:2749 with SMTP id
 h24-20020a7bc938000000b0037bfdaa2749mr2996574wml.88.1645039626622; Wed, 16
 Feb 2022 11:27:06 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Feb 2022 11:26:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
Message-ID: <CAD=FV=UZwuYRMNOxX6_W_z1PC-UNqvN=Mdtskn=djPPMRE122w@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/5] dt-bindings: display: simple: Add
 sharp LQ140M1JW46 panel
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
> Add support for sharp LQ140M1JW46 display panel. It is a 14" eDP panel
> with 1920x1080 display resolution.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v4:
>   None
>
> Changes in v3:
>   None
>
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
