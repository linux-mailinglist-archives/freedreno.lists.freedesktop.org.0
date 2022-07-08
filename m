Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6216356C10E
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 21:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB46010E104;
	Fri,  8 Jul 2022 19:24:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35B10E09F
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 19:24:31 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u9so28092072oiv.12
 for <freedreno@lists.freedesktop.org>; Fri, 08 Jul 2022 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
 b=InH2K7dH2NjuGoaeuhMHZJKkEoIt8KoqlBs0E+Q3TTBS5RZRETLKTZRZT3Y0z2Gv/r
 2khUzoWLTbkefDeaKsc6pHYPsvYpONGBlM58vaEqm98vTDeKmrMelIOsi+LNxKzJ++6F
 HaSvWuREHYxyFwh4AjtzoLhPQruLwmmGLLxKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WEH0jKAhMg/R/ZAtXcmhJHyQlTHAR3FwpDaho4cHgOY=;
 b=ygSjFmkUDldOeRISuE2iBSmJcdMn3FDlleaAly2Y6BNd5XAu1TepIzCPitvj9gRiUE
 vXTYCWBUQx5uZR0vFmAF+lv7H+uLw4HwOByKUSxJQ3NCuDgfkM2PR50aOxX9P0jNpUgp
 idrq5BX5eW0ffS0qFVmXR9hy5b9Iy9zVE+HXZq3rHw7MdYWmHzizxy2YbAU+w/RW6HeI
 jadZ2nbeq7XqMiIc+QR30s2DwRq9DGtPYDXjLiIPMflX2h0K9Q7j1NIyxTZv0U4540EM
 xeM97GZFxFzFeZd3HJDpMPtm8drs4E+5xJPjZJ5X1NQ82CO1au/5xywAprAr/AMVsOsp
 MhJQ==
X-Gm-Message-State: AJIora+JIbgm+KSEXKcaTtBbtSh5JzNidyMULDmXMBz7ZJdVXkst/Dyw
 NcjZG7Y+psvc4f4Ag5vxZ+VSvuMMMDnMJlp1cJSdSg==
X-Google-Smtp-Source: AGRyM1ux2p5+c4xtdy4iOeVBnPoqwt4uYj+n6OsML6osTpvAhyLCATU4q8jvRdoE/W3LIwJY4+8mxYJs/1atXzH8xbs=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr831806oib.63.1657308270538; Fri, 08
 Jul 2022 12:24:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Jul 2022 12:24:29 -0700
MIME-Version: 1.0
In-Reply-To: <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
 <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
 <36a3490f-5c94-0c54-caa4-1b381dae7745@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Jul 2022 12:24:29 -0700
Message-ID: <CAE-0n53GJANJT5uXzffPqFZuKu4YkzfrhyaCL15vq1VQrDzSag@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 5/9] dt-bindings: msm/dp: account for clocks
 specific for qcom, sc7280-edp
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 20:59:02)
> On 08/07/2022 04:32, Stephen Boyd wrote:
> > Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index f00eae66196f..1ef845005b14 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -119,6 +111,50 @@ required:
> >>     - power-domains
> >>     - ports
> >>
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sc7280-edp
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: XO clock
> >
> > What is this for? I would guess it's for the eDP phy, but that isn't
> > part of the eDP controller, so probably it can be removed.
>
> Good question. I was documenting what is present in the sc7280-edp
> controller DT entry. Could you please check if we can drop them? I don't
> have the hardware at hand.
>

eDP works fine without those two clks on CRD (hoglin). They can be
dropped from the dtsi file.
