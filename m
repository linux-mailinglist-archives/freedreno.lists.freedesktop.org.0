Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFD85A1A86
	for <lists+freedreno@lfdr.de>; Thu, 25 Aug 2022 22:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CAC10E0BB;
	Thu, 25 Aug 2022 20:45:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AD810E0BB
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 20:45:14 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b2so16152618qkh.12
 for <freedreno@lists.freedesktop.org>; Thu, 25 Aug 2022 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JSdjfSerwO9g3FetOi7P2/z3DUhKbfEFMVDhVV6tWU0=;
 b=QwTxLxiLBlzJmnpR4e5JEgqt2ejJY07csEDIYEFOKyxGG8zoSOVOQJwlxOuHZ5frEt
 JTXlELuo6jb8ZoEpTAaNbc0NUs2IMgYOwyN0DTNm2UQPyyEdAvVZMnVVizGw2ECi3f8S
 i2+gcxgq1DocFRWxm6XC/9VViqnzDs/YGI8knWlOQTUezobvptwaAQXlwux87HUyXoYX
 fUVtBPrbmNdRMh9jCwAGxa0akKcKCFrbzbnllbiNmqXcqtJJTLECllEh8mhy8S5eRckp
 HS+4WzBG0sXXMP6Exo9g8nyR23Me8b4FfTr3U0V0MCckQkjX19lokUHv/6KT33baTmO2
 pyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JSdjfSerwO9g3FetOi7P2/z3DUhKbfEFMVDhVV6tWU0=;
 b=290C5sg6O3NsLjqu5kUFlE7klJc1uxcGxTxUTZHI4E6whWHsWelmMID5pMtx8ng3d2
 pxQHxP6D3f+JVKO3TLm1zJzYXu2EnZtyTWSDLQZUke6WBNQ/SBDnqC3umK5CrqVNZEPl
 dwT8zcWovSctg0QbLN04n4uEpyTtqB91tgJ8yLWxrldJse5eHaR/bB5eoXbXjhIvZtEa
 NPh9PbRP8ekjlzIx0Jx0/DEjvRnF+zCFFhIN/ja33uBPDh9xYugPcp/ATD136XcjEYx8
 OIQlq5Skx1aWUb4Bi0OnG1C0i0NGg4XjxN0Ce4z5g38xRNCk6f6+w1275xCPImLWIw/I
 NgFA==
X-Gm-Message-State: ACgBeo0KHrI8pV9CoeelFwY03zMOZA4Z5Y/t4pWxMeHN6VZcQaRD7QeG
 1l2yY+TaF/RjnAl7WNTyKW4FGYPXSE/jXW8ThEr4UA==
X-Google-Smtp-Source: AA6agR59SBka8UoNuAgg3yQp3xn9OsXleeXOcLXhYq5qifIsMU113ZdZhZAiLqMuR+VCW+SW/t1ph6ZO1ZtCVG0UVnU=
X-Received: by 2002:ae9:ed0a:0:b0:6ba:d20b:1002 with SMTP id
 c10-20020ae9ed0a000000b006bad20b1002mr4454602qkg.30.1661460313180; Thu, 25
 Aug 2022 13:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825201148.GA1607980-robh@kernel.org>
In-Reply-To: <20220825201148.GA1607980-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Aug 2022 23:45:02 +0300
Message-ID: <CAA8EJpptkjYVcz+CtLmYHk0gdqXfGPDJaS5XJtJcQNs9m4ZGBw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 00/10] dt-bindings: display/msm: rework
 MDSS and DPU bindings
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022 at 23:11, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Aug 25, 2022 at 12:50:53PM +0300, Dmitry Baryshkov wrote:
> > Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> > devices). Cleanup DPU schema files, so that they do not contain schema
> > for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> > afterwards.
> >
> > Changes since v3:
> >  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
> >    dependin on the mdss compatible string.
> >  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml
>
> My scripts tell me I reviewed these, but I don't really follow what's
> changed.

Previously I used the $ref for the mdss child nodes (which resulted in
errors for disabled DSI PHY nodes). These were replaced with binding
dpu/dsi/hdmi/phy nodes using the compatible properties rather than
using $ref.


-- 
With best wishes
Dmitry
