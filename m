Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A234DD1BF
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80E710E8FB;
	Fri, 18 Mar 2022 00:13:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C566C10E8F2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:13:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z92so7517488ede.13
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
 b=dq9FFRkofEvY/IQ16q22b9/GAC3XOlX/hWO2uBaym9wfsa21t2RqyXXsmcT4+ouP96
 sP5cckwa32YJttSDlHHjJtcORahNzuY8gpmwhPkulTeNBPqbWSAOutMIuIyMEvN2fd/q
 cw6DsfvWgKS9sZLyHWDTyO4TD4lLr/+JK5JXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
 b=kC5CVtaAjaqLSvY3uEjdi4Pyi0ajAgxunQixMTdkUksafpesytmYw63Xq7xr1zZ5qa
 plrNjY0CG2YVrVZYj4CMNKTt31Wn65wWjujI0hoUHn/1jUxpUT4UzM5c9olqJUS94GPd
 Cetne/mmBOlxGP502EEdN6564MWPPAtHufdva6zs4SBjAmfuWPKSMqXjmChDqxb7iiMT
 2Sb5thGvwkS2q1J6/4p7kV1ykwcC/+MghSergNjEgIIDkpese7Y71qnBgyzogVHQkpog
 0xjjVpj9R81AzU5CIEqG5HNd1NuuWZPo7iROFMMGxVjkcCED8h5Uz0aBzSiaEoR2VF3U
 mz5w==
X-Gm-Message-State: AOAM531wgQWknVHCp1mGxWG2eNb/rsYYgZQ+T+0oBtDvBdWSwx/I0NEt
 XP2iV/2Pn/Z0nXv5JvVLtGd6nunHAA8B4u6Mht8=
X-Google-Smtp-Source: ABdhPJzz2dp6a8dX97jVN/AGrEP+elDgDQpPZoRGXiPXtf12CbnxKX3IA+YIZKxcqBwkwhUq90f61g==
X-Received: by 2002:aa7:d904:0:b0:418:d53b:4662 with SMTP id
 a4-20020aa7d904000000b00418d53b4662mr7164762edr.217.1647562389971; 
 Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 t19-20020a1709060c5300b006d582121f99sm2995876ejf.36.2022.03.17.17.13.09
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id d7so9637822wrb.7
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3723782wrw.422.1647562388738; Thu, 17
 Mar 2022 17:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 5/5] arm64: dts: qcom: sm8250: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
