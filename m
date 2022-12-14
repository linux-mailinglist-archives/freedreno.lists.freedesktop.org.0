Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE264C620
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 10:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A110E39B;
	Wed, 14 Dec 2022 09:40:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A603510E39B
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 09:40:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q6so9442478lfm.10
 for <freedreno@lists.freedesktop.org>; Wed, 14 Dec 2022 01:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Na1nf8qjjb1uMGoebJs/VqSMr6q5uwCqvQJ2Ul04o+w=;
 b=YBVPuBr0jQKvXOKcWIdTT4V+PF+IEh9EFO+h1JTbjhB86iMmEgTMXkROy9xjNdDqx4
 jpGYcATEhqkzZ9RjQomgPHMwbMFBmfCT+MuIFYt4KAU/hZ/3PtVIf0k7OgAC/Oy+Gz7t
 pu5Sde0A8HvWabj8UWSQd1hR+2bRnXI8l5G3BWDfayRUqbnVAnABL83boyiBoI4g1KjP
 JCUJaCqOtHUfyIybEzQgcI0ItHC1kgpfx9SXRrszffu05E/dzlJ0kMahaf4hsPK+J4gv
 bYTywPFS6eB5+Bj1CjC+ywEQIULQgC5wjCG7SLXM+Obb4EKuOfB+Jg+UCnvECyGA1/aW
 XeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Na1nf8qjjb1uMGoebJs/VqSMr6q5uwCqvQJ2Ul04o+w=;
 b=O/gWSqdL2FJ7YiH4lGevPUWYaiOabK024SbxZY6YsM2/QRg8hOL4j0MkkvNz0c9qeV
 VyBSQULNhMK141kMhYREtExl7EnRziec9A6WuutZWm+aWXzwrT+7M0Al7ZPKdQQ7MBnF
 tCTH/HFFgmL8SDz5iKdQm63ICqm3fdyLMWbEaW9OqLVeinzkkNf/lrp9HeHx6NRKvgw0
 k2uJpxzmMcACNmnZFw9rU6oVx24Q5783hMZUrsAYFpEHeR0QgKNh//DH2cGo+9p5XeWf
 oUY3nEhdQzRDhMO81OZk5KSacIVA/w+M/pzcyNc4uGF6eFB3u3RQ00axGznH3o6+hQ7a
 DuOQ==
X-Gm-Message-State: ANoB5pkOxYBA1M9fNxohJ5fkrbN0DTyyIWWE8/qU3+KnbTtYvM4LNxBb
 8G3MSvejmDo4dW5k0Tuzaghavg==
X-Google-Smtp-Source: AA0mqf5bAzf6oxaXCjoLImk3QkwtNBbzrPPDJ1DfSP1B46ND5nVtJkfVfzcY7e3jBODV9kNLTtpEMQ==
X-Received: by 2002:a05:6512:308b:b0:4b6:e4b3:d82d with SMTP id
 z11-20020a056512308b00b004b6e4b3d82dmr4229361lfd.7.1671010831840; 
 Wed, 14 Dec 2022 01:40:31 -0800 (PST)
Received: from [127.0.0.1] (85-76-128-40-nat.elisa-mobile.fi. [85.76.128.40])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a2e9ac7000000b0026c2d2a9b92sm544123ljj.101.2022.12.14.01.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 01:40:31 -0800 (PST)
Date: Wed, 14 Dec 2022 11:40:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Adam Skladowski <a39.skl@gmail.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <86FA3AF9-5B35-4E27-80DA-8B5BF9E6B3AC@linaro.org>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
 <19e78a06-2f3d-92af-1988-b22dc3ffc84e@linaro.org>
 <ad7ecffc-3fc9-7859-82b7-9d161fc28cae@quicinc.com>
 <86FA3AF9-5B35-4E27-80DA-8B5BF9E6B3AC@linaro.org>
Message-ID: <558C636F-850D-41AF-9CA1-CC3E8E5C04F9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v2 01/12] dt-bindings: display: msm: Rename
 mdss node name in example
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

14 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2022 =D0=B3=2E 00:11:58 GMT+0=
2:00, Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg> =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
>
>
>On 13 December 2022 23:53:48 EET, Abhinav Kumar <quic_abhinavk@quicinc=2E=
com> wrote:
>>
>>
>>On 12/1/2022 11:54 AM, Dmitry Baryshkov wrote:
>>> On 30/11/2022 22:09, Adam Skladowski wrote:
>>
>>>=20
>>> We will pick this into msm-fixes during the next cycle=2E
>>
>>Yes, we can with the above fixes tags but first, can you please send a M=
R from msm-next-lumag to msm-next? So that I can send a MR for fixes to msm=
-next=2E
>
>This would create an additional merge commit in msm-next for no particula=
r reason=2E You can branch -fixes from rc1, or from the msm-next-lumag and =
then send MR to msm-next=2E

Another option would be to base msm-fixes on drm-next directly=2E

>
>>
>>ATM, they are out of sync=2E
>>
>>


