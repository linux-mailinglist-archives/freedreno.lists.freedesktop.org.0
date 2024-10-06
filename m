Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E72991F39
	for <lists+freedreno@lfdr.de>; Sun,  6 Oct 2024 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162DE10E119;
	Sun,  6 Oct 2024 15:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fgwBVk+R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56D10E033
 for <freedreno@lists.freedesktop.org>; Sun,  6 Oct 2024 15:01:07 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6e2e41bd08bso5918447b3.2
 for <freedreno@lists.freedesktop.org>; Sun, 06 Oct 2024 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728226866; x=1728831666; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sr7kBmgWEcI5rnWGX+RCamDzTizwOpc6au1fxKMuuS4=;
 b=fgwBVk+RZTXzs4Fc2ZlxArts+2wJnhqUqpnIUJV4A8jeoeEj66HPff8EYGHe21ueGl
 A04UuuAGDQvMDoSpHgE72FVnrXUI08v9B7NESlU3U3bv7loCMQHNsLOn6Y8uWa+ps8hp
 LjL3wUgTIXjmNf/VyPhhvTT93csPkTM07IuucrdSAXRcga/NDRMFCZAUpxS3OT0ltgg0
 PfHcu59zRitVxUTpZFjS0nGp8tbkZ/8zpvjIIPaA6ALnJ+x3EVYMUbZFN8dTP8/zk6IX
 q9XFQx4ef9KmmT8UvRZATrJ5luc/Mg//htSx373x+YwbvG+ZsUixLQTM+GZs+lUeRbah
 CJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728226866; x=1728831666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sr7kBmgWEcI5rnWGX+RCamDzTizwOpc6au1fxKMuuS4=;
 b=q/ca6/tLKEBSML8RSyrOOARw1R42ykf4VEgxq/LPP3kPAFvAjRb4WLbB38gbM0vJjD
 B13L8eAgMq9N1ct0j3P93V/Fl5BYJQUxBGW8J0fygR5ypDkhWAWdhKedPab/6LDGxew/
 4I//7hTtM438/bzyLqC6C3KhvxbVTqwJoJG2am/TLKg9YEVCH6w5Uosn9h+AHA/q3m/x
 zuOHfY8Zm362uoerDWwblGr4gFrYSYnEKpQNPaDOPaI0RWCZID+jzlio6r4ZYRPjEETw
 n9GTLJRfaR8i1Rdrs6uL5SnPkGo0KlefSzRv70P8tmdq5w2FMrC+bfy74hv6Xap+/89v
 +YJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLUVJuGKLjQBmi6p8uhYB9o9oV5wARPpzIHM/am6+3cOetXc97xryVcB1fbIvZ4WT+Cjc1IbAd4Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAgtACWbOiZvb+aWfMf0RRRop6ByWJhyzaX+s9w1md9PFg59mt
 fblbdRIq0BjYU/lctwZnNfffwRHW3eP+bXLSCoo8xdn5ULfpk2dIPeqiDjHQ0fkK9L1nMRHY0Ko
 e47dyBWK7RnS4PaP/Zec7SFnrJOflrta47JWzRA==
X-Google-Smtp-Source: AGHT+IEJycb4R4aw3ReSCNgChwzrEXysCheiplWAjzc1sd3W64fhBUYqqbDLQsAk4nGd84s5GZgRtnV6rDxt3bUR/NM=
X-Received: by 2002:a05:690c:101:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6e2c72466ccmr69109727b3.27.1728226866169; Sun, 06 Oct 2024
 08:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
In-Reply-To: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 6 Oct 2024 17:00:55 +0200
Message-ID: <CAA8EJprNz-Byy6T3qkkUyZnTkyb_7osyuevP8E-xYzzPSmQjUw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
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

On Fri, 4 Oct 2024 at 12:30, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
>
> ---
> v2: Fixed review comments from Dmitry and Bjorn
>         - Made aux_cfg array as const.
>         - Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
>
> v3: Fixed review comments from Dmitry, Konrad and Bjorn
>         - Used a for loop to write the dp_phy_aux_cfg registers.
>         - Pre-defined the aux_cfg size to prevent any magic numbers.
>         - Added all the necessary DPTX controllers for this platform.
>
> v4: Fixed review comments from Dmitry and Krzysztof
>         - Updated commit message.

For which patches? How?

>
> ---
>
> Soutrik Mukhopadhyay (5):
>   dt-bindings: phy: Add eDP PHY compatible for sa8775p
>   phy: qcom: edp: Introduce aux_cfg array for version specific aux
>     settings
>   phy: qcom: edp: Add support for eDP PHY on SA8775P
>   dt-bindings: display: msm: dp-controller: document SA8775P compatible
>   drm/msm/dp: Add DisplayPort controller for SA8775P
>
>  .../bindings/display/msm/dp-controller.yaml   |  1 +
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
>  drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
>  4 files changed, 61 insertions(+), 24 deletions(-)
>
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
