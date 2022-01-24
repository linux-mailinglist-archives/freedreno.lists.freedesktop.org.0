Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1954498BCA
	for <lists+freedreno@lfdr.de>; Mon, 24 Jan 2022 20:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A4E10E9D6;
	Mon, 24 Jan 2022 19:17:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B010E9FF
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 19:17:09 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id w6so20814931qtk.4
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 11:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Hb93v/cG3xs7a91RJePhFR111coG45/XiAqaJtoOXg=;
 b=dekshM3r0iZqRnweN0cD1KEJ/ymwv3d8zD/lK38pye/d6XexTA41QPH7eF7J5ydIuP
 T+vohEUegraekD/fwapCJeRUIjZm0tUtukdNQMo4cg6MypLPrzRTcMH+JFN8qkid4b7c
 Fh307MemSL7Jm9rjOaMJSBJKqt2OAxti9p2cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Hb93v/cG3xs7a91RJePhFR111coG45/XiAqaJtoOXg=;
 b=dbm0pjS+Rx7+eD/bj8JidCXv71YIrcbTdtFRJfYrsx7ER3J8cNwUl9NFoYIo1Fi41R
 CZ3bUpKx6WepYXHJebFopFnFuhZCkwHD0PH2ktzbqI1DNj9+dxSmV/A/9/Y9/7X9U8Nd
 ZVKOrnfmDG8PfPVsLqqjKRvTyDCmkl4H3ihXAFV7tqiFrkJ1VGvZbxnbUq7hdtKOWeqT
 +vBq28zta5+3fieDC5bnS+ebwvhb5yj+uLkCYnwXMYOL9RskuG5aYDYW24WhOFfecTDC
 jm9YtfSsOptlZWxpGZ7JQEwUJuSM6xqYbC5LRBMl0GvrtFt/fz0ylmaD1UKI5Q9iD9u6
 8oSQ==
X-Gm-Message-State: AOAM533gc9wEqo0/6JZaGgWhsru/tOMEF2h+gRG2U7twV7Eb6BPUwtED
 vkXJ8E8qWnyhsRS+aapW4JLpN4B/18Zxaw==
X-Google-Smtp-Source: ABdhPJx3ZnphD65d0799Tccud5uvIQDqIchQXqoLykaodM2Yo/95rZFIcBrR1qzTAy1Y4Qf38gIeRw==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr11997459qtx.116.1643051828399; 
 Mon, 24 Jan 2022 11:17:08 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176])
 by smtp.gmail.com with ESMTPSA id a141sm1539733qkc.73.2022.01.24.11.17.08
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 11:17:08 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id h4so198084qtm.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 11:17:08 -0800 (PST)
X-Received: by 2002:a02:c726:: with SMTP id h6mr2352523jao.207.1643051459292; 
 Mon, 24 Jan 2022 11:10:59 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1643048114-2996-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jan 2022 11:10:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLzCc-M6CMYOMMZ6cj+RMdwi4Uwsde=2s5V2pMWj_QTA@mail.gmail.com>
Message-ID: <CAD=FV=XLzCc-M6CMYOMMZ6cj+RMdwi4Uwsde=2s5V2pMWj_QTA@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/2] drm/panel-edp: Add sharp panel
 support for sc7280
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
 <devicetree@vger.kernel.org>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_khsieh@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, quic_mkrishn@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 24, 2022 at 10:16 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add eDP panel support for sc7280 CRD platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 176ef0c..bb2e346 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1605,6 +1605,14 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>         },
>  };
>
> +static const struct panel_desc sharp_lq140m1jw46 = {
> +       .bpc = 8,
> +       .size = {
> +               .width = 309,
> +               .height = 173,
> +       },

Where are your delays? I very much doubt that they are all 0.

I guess you're also not putting timings in here and you're relying on
these coming from the EDID? My own preference would be:

1. If you are relying on a reliable way to read the EDID of the panel
then you shouldn't even need to add anything to this section of the
file. You should use the "edp-panel" compatible string and then add an
entry to the "edp_panels" structure.

2. If you want to support folks that don't have a reliable way to read
the EDID then you can add things here, but you should add a mode.


> +};
> +
>  static const struct drm_display_mode starry_kr122ea0sra_mode = {
>         .clock = 147000,
>         .hdisplay = 1920,
> @@ -1719,6 +1727,9 @@ static const struct of_device_id platform_of_match[] = {
>                 .compatible = "sharp,lq123p1jx31",
>                 .data = &sharp_lq123p1jx31,
>         }, {
> +               .compatible = "sharp_lq140m1jw46",
> +               .data = &sharp_lq140m1jw46,

Two problems:

1. You should use a ",", not a "_" to separate the vendor from the model.

2. You need to post device tree bindings for this.


NOTE: if instead your eDP controller supports DP AUX bus then you
don't need to add to this table at all and you don't need to add
bindings. Instead, you'd add your EDID panel ID to the "edp_panels"
structure.
