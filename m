Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D1390784
	for <lists+freedreno@lfdr.de>; Tue, 25 May 2021 19:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76636EA8B;
	Tue, 25 May 2021 17:24:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E057B6EA8B
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 17:24:54 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so29388831oto.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RR4xoh8acB29qJPitkb2wSC7JB6AOVStGTvrt20hM8M=;
 b=X4X35sDWeBb8yjiu2wga4t0uG2LuMIKkR8vb8537T25TUdcZecYeNPM+6j92rt10Bj
 kHoZFMq36Kj+yuWTRdctsxqVOXm5jSQV06MN7AA6b5TdV4lu9ux13Zt6d27g5NELi5p4
 kOFjT2uI16WjvUGvOa6UOUGhDbfW/1ZaPBYlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RR4xoh8acB29qJPitkb2wSC7JB6AOVStGTvrt20hM8M=;
 b=qnn95UFUqsgoza1epSqRvxA9X3d0kf55hDT53ZGDCyt9VQ9GfTzSpCGIJgq2QZ3SMR
 kb5wBjiYLJ7ZzdX62qh5LPHSmIULhiPkhv6mAhpysmX5kP367ClHDlXZulxyNwZqkF+v
 RmK3nwr9759NcHEC97B2ikO+WQ5uMMHocEBYeukitdjY6cRbWxwBXozj91osod2lwWvc
 DDLTS7VK+veTdfBKAJmXB+ZN1RHlxutWqaPCOkO5X1lXgHuyIsM1yf27w5kQySdojPZ4
 /6xBdkZIU8GcE/fkoOP/k3SbpyGPvoMLshU/JcIVKqx9V6TWisxbzxa4V2tGaCmuIQ3i
 Yu8w==
X-Gm-Message-State: AOAM532xIsRdd1iwI2Ewtb4pu05BhQWBECeZIEp4R9iLoonaBKEEM9zy
 plyQa0P6Tj4s2XLsPpPk4g9ELb+KHDPXNA==
X-Google-Smtp-Source: ABdhPJz25sznuHwM750ZOMInd9TNzhmCpQiL2EOaMNN4uhQD9wXkJeyb2rdCwUWRPorBwJni6+scjg==
X-Received: by 2002:a05:6830:1e70:: with SMTP id
 m16mr23869778otr.340.1621963494081; 
 Tue, 25 May 2021 10:24:54 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com.
 [209.85.161.42])
 by smtp.gmail.com with ESMTPSA id a18sm3135714oiy.24.2021.05.25.10.24.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:24:54 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id
 j26-20020a4adf5a0000b029020eac899f76so5566131oou.7
 for <freedreno@lists.freedesktop.org>; Tue, 25 May 2021 10:24:53 -0700 (PDT)
X-Received: by 2002:a25:d846:: with SMTP id p67mr5418346ybg.276.1621963152429; 
 Tue, 25 May 2021 10:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-4-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-4-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:19:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VF+oggiTffSk5S0Bo0FA0ZaWKURkkqJBPWDjkyQ+Vspw@mail.gmail.com>
Message-ID: <CAD=FV=VF+oggiTffSk5S0Bo0FA0ZaWKURkkqJBPWDjkyQ+Vspw@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v4 3/4] dt-bindings: display: simple: Add Samsung
 ATNA33XC20
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
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Lyude Paul <lyude@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Add Samsung 13.3" FHD eDP AMOLED panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 4a0a5e1..f5acfd6 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -242,6 +242,8 @@ properties:
>        - rocktech,rk101ii01d-ct
>          # Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
>        - rocktech,rk070er9427
> +        # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - samsung,atna33xc20
>          # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
>        - samsung,lsn122dl01-c01

This panel is slightly different from other panels currently listed
here because it requires the DP AUX channel to control the backlight.
However, in my mind, it still qualifies as "simple" because this fact
is probable and no extra dt properties are needed. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
