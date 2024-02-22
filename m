Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25885F4E4
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 10:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63010E8B3;
	Thu, 22 Feb 2024 09:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DyPStr+N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AA410E8B3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 09:46:39 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso7518755276.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708595198; x=1709199998; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
 b=DyPStr+Nn9J1y5gvBWtIULlEOd9NARaUX2/kNpV051mcUzlYEJdSeavv/YoXNwpfCu
 hL3JaBPYcyxLwJk6mwZgp68P0Y96YkJP7mbUmKH/ojMxRvyFfW4X72jLX+o0j4vmlse1
 W/H4k36WriZj1BDNsOR5uFY5XdvUNJ9LAyvtBx+Kofxn+Up+GSKBtSW38Gz4yzz4Ki/U
 hj79jKmRO4KtH2vewApVgieA8kHVdSBCGtViNUvGJIg6QBmgu0fCiiasiox+Cwld0sQH
 lh5vaFGBUeP39JO5MNCSPMjqqW7YhjMyseNKYh3w4TmqFrJsbjKZQQY23Mc72dDCUaxE
 CKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708595198; x=1709199998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
 b=E/qGeyLdDgPGW/+F11lziXPmkKCAiKXhHHeM9XHrMNFfY5DuvcSmh48VHl05XSSNlB
 eQEUwDc5y58dpyvcOLhL8lMIwL6T7dKEAMpJjwA6/Wg0vn1VESi73ZGeSvrOR96jtE4t
 IfNqWqmBxcH0vV7tVKUalwU6GjpJTWCmLIsKQDgqKm9nx9NXmUC1Ocjg0OYObvF7l275
 RVeueoha3U9Xn2zhZq8/1l9B5fUfgL0uTzFZ7TS4watNKGcI+VFWyu1Nny5VAnNlIERG
 F4Zc4cxd1PDhRgGQpT810vQ4K7UX+mUQTxq/X1pRBGCgpDiZT6CmifqkkjVDpZENpr9V
 FIig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBLPP6lMyIlG984UNzqpn5CKSWuRtzxtbiSk3sKQheuz5N+GzMotmrZDVVLJwMk2eZYTaiY9sK9hiMpf+/C/ETj41tl2bHog0KweM/BJjh
X-Gm-Message-State: AOJu0Yyxi2o+1qe2sN+cjXDe9KAPY9CSyICo3ucQKEVpstOyVl66NPGX
 XIGuXlMLP/Bxc2MZqr97vY+Cy8YwbefwVLpv90dX4ig0w5pnnUTPEDYcUMlFdm0ee7ReX8QbCEi
 znmL0Gi7Xk0lQn7UW/DCZ6a7OvjzQXZzGyuohyQ==
X-Google-Smtp-Source: AGHT+IGEyFWMc/Bnv5N7cDt95kU2F8T66cMEz+jPU0sJPw/x3JWrXvmnu3gbf07WKBKu3lfbVlW8M9QwMg8fyGR6PUA=
X-Received: by 2002:a25:c805:0:b0:dcc:8114:5a54 with SMTP id
 y5-20020a25c805000000b00dcc81145a54mr1737712ybf.43.1708595197808; Thu, 22 Feb
 2024 01:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
In-Reply-To: <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 11:46:26 +0200
Message-ID: <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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

On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >>>>
> >>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
> >>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
> >>>>
> >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> >>>> fix this.
> >>>
> >>> I think we might want to keep this disabled for ChromeOS devices. Doug?
> >>
> >> ChromeOS devices don't get a special SoC
> >
> > But they have the sc7280-chrome-common.dtsi, which might contain a
> > corresponding /delete-node/ .
>
> What does that change? The clock rates are bound to the
> SoC and the effective values are limited by link-frequencies
> or the panel driver.

Preventing the DPU from overheating? Or spending too much power?

-- 
With best wishes
Dmitry
