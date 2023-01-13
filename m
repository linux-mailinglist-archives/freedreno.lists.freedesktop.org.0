Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D218A66A4F4
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 22:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13B10EAFA;
	Fri, 13 Jan 2023 21:15:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023D610EAFA
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 21:15:03 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id o75so23926446yba.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 13:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rE5GJmOWoLrmmtmr1ZiRc6lZFA32Ba8YbTIiq8KjYCU=;
 b=FbJNsENvCy8Q3dEkgzHZ2B+QydIyecG+w7hnVY1jI+O3K866Fs/TyVz+PSQeAFHS8P
 qkGTGdkeB/ttCAtTOlOTsmclCJMp4Rj5N2kLAQW9a5eE0aG3on81N1iy2XrjxwaBQA38
 PsqorpTvfS/snpkyxDBAVfZwrWqok7wrqwMOsfLLyOP1Er6LO8x82me0cvB4FdZFozmf
 CWunX4JJAYyF81qLTuy8WfqLZzX6tjjtXu+uA+3gxW7UQw68D5Z0e1rXn0FIj4y63QWl
 WLKPP/YuHMKq0CLBnR7N4a2eKQ6oKU4YOXLYR6kI8xNw+rTExeBtmFS3NObr2bYOvM6u
 oynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rE5GJmOWoLrmmtmr1ZiRc6lZFA32Ba8YbTIiq8KjYCU=;
 b=ARcfU8+2u3sO6Jj6gOC/dERu1JqU4mAQx6XRfDWvY02zX4aOACj5Y6F42Nct25JULD
 LCnkM0OS2/MzBU54GqaT9v75rWxb8vr1306vtBX3ur70I8NipiGGjOY2LRdPLnlC1/6+
 rgvPGXyWupIyGQldyl6KQAuz51xOJqpfgvvOJhJ9/ceuFLxstL2w4RT3CVbLgIGsBmkg
 Z/eqwSdNL3VQKykdQjzCBJ1wPl/iGbITTBdpP5cZx8Y4wF23RTk3YqyM1V8orFWrKYvU
 +S7eKCydLyd54Uvoi0I2BS0tSw4cK7Vz15O5QssVm7IXaTk2yJaA8zzub4KXLQdGuTNP
 qjeA==
X-Gm-Message-State: AFqh2krCUnxB3FWT96JKMrBOHygjLCXC/p6ZMJj0QOHsTavX9YKiK0rQ
 6T1x0TNb5/4vr0664z3Jw/4b5Fxf4f/lGBsmEGlwgg==
X-Google-Smtp-Source: AMrXdXufM+a0cNtAKwMruSwOhgbSmi5XuyfWOrdPyVuvRaWuv8J3cB39OBZ954HOwr1pSUGSX4+KqoQrdXapS/PccDg=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr7297951ybg.288.1673644503066; Fri, 13 Jan
 2023 13:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20230113063351.24131-1-dmitry.baryshkov@linaro.org>
 <20230113210807.GA2901424-robh@kernel.org>
In-Reply-To: <20230113210807.GA2901424-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Jan 2023 23:14:52 +0200
Message-ID: <CAA8EJppi2254wTxMhC=M=Cfo3eA+K0aVqDVzbFAbYHCTnFF85w@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm/dsi-phy: drop
 unused allOf clauses
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
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 at 23:08, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 13, 2023 at 08:33:51AM +0200, Dmitry Baryshkov wrote:
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-20nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +--
> >  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 3 +--
> >  5 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > index 3ec466c3ab38..71702151bafa 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > @@ -9,8 +9,7 @@ title: Qualcomm Display DSI 10nm PHY
> >  maintainers:
> >    - Krishna Manikandan <quic_mkrishn@quicinc.com>
> >
> > -allOf:
> > -  - $ref: dsi-phy-common.yaml#
> > +$ref: dsi-phy-common.yaml#
>
> Convention is how it was. Partly this is legacy because earlier versions
> of json-schema required the 'allOf' form or everything in addition to
> the $ref would be ignored. I left these thinking more than 1 $ref here
> might be common. But probably more common is a $ref and if/then schemas
> and I'd somewhat rather keep $ref at the top and if/then schemas at the
> bottom. So maybe this is the right direction.
>
> I don't really care to define one way or the other if we can't enforce
> it in the meta-schema. I don't need more nits to look for in reviews.
> Adding a check (i.e. allOf must have 2 or more entries) would be quite
> invasive and wouldn't allow having 1 entry when we expect a 2nd entry
> soonish.

Ack, I'll drop the patch for now then, If I got your message correctly.


-- 
With best wishes
Dmitry
