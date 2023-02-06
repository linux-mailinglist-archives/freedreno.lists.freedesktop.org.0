Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864E68C416
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 18:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DF410E9B9;
	Mon,  6 Feb 2023 17:01:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F1210E9B9;
 Mon,  6 Feb 2023 17:01:18 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso3360985oti.10; 
 Mon, 06 Feb 2023 09:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ftsYnNwfAHRlDnIU3/2K9ANJVoP0nQzARnX/oV/Q5nE=;
 b=If0f5QQyK8QHIoQ45VubJix1KsoEDmW9tpb7j0gPAYTYsNFMaoOEqCgRr0dpr2jsxt
 uQyIzchy6ikrYhNnuREnKIDJx+7E44rZGSclF9f+LXNbOVmLxCl36ldb04oRrwRLG5jD
 4hBjyToNkr3/Blqu2kkRXtMMseKaaaKlrmalCDGgGljhNqCZwgAgjlp9DSt3GsP0r7nt
 k47e+B8zs88tzJg3jHylR4bICUcfSfhbubFvpGMnuCOmJvym5kjl1ERChKCPYIkTD7cc
 ZQkIGNCn9GBli0CZ76hnxnn72ljyNEt44flXKcZrZ5xFeuxx0pXkp1P/ux/LzAOmkWaa
 wJYg==
X-Gm-Message-State: AO0yUKXLWBSo1F1A43beluSNw1b/9J4yaNOGbq6L5wSvIm4pcqmuHupN
 o4s1992VvvieEJTjkyWdPw==
X-Google-Smtp-Source: AK7set8IlglwpH0WJv/MQ+9QnqEUE0o4e/FYzaxxqKBSSV+ySvVKlkQIAgWzXHjyv36wLGYY/XWAVQ==
X-Received: by 2002:a9d:2af:0:b0:68b:d7cb:dd62 with SMTP id
 44-20020a9d02af000000b0068bd7cbdd62mr160379otl.10.1675702877032; 
 Mon, 06 Feb 2023 09:01:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a4-20020a9d74c4000000b0068be372babfsm5231719otl.47.2023.02.06.09.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:01:16 -0800 (PST)
Received: (nullmailer pid 226818 invoked by uid 1000);
 Mon, 06 Feb 2023 17:01:14 -0000
Date: Mon, 6 Feb 2023 11:01:14 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <167570287416.226763.12601295284493714271.robh@kernel.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 3/8] dt-bindings: display/msm/gmu: add
 Adreno 660 support
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 06 Feb 2023 02:27:30 +0200, Dmitry Baryshkov wrote:
> Add Adreno A660 to the A635 clause to define all version-specific
> properties. There is no need to add it to the top-level clause, since
> top-level compatible uses pattern to define compatible strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

