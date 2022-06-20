Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30E551319
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 10:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303C10E2D4;
	Mon, 20 Jun 2022 08:44:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD710E2DC
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 08:44:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id s12so19674136ejx.3
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
 b=GPJVd9wkS9872Pj6ecAxEq4OgSG9RQlHL7uaN25HxLizxECezEa516LpRk84sqWK3Y
 fWhr02IZzun6+I5QhG6UV4h7kEJ615sHnaYtV1mA8qPMVQc/vd4UZHDX8HAGh76E12aL
 RB2eyQHZcDVnN/wLQ+E9FtzLksHOdVnc4UMA6bNJm6V2QtPXeM3Wd22lQbPTxGKZuiBT
 DN8OVWndEk+6BM8JCt/OAdkxe/MLv/cxfDxfY8tOPuhMIfyDPKDQDROTERcYrBnHAlRe
 DuceiGj5V9LPzVZP+npWxX+NDPlSg9SJywqHCgbnpQfwPla/iECYH/RktYNt90kJlRDP
 PZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YVi3D194sdyxvkGLsBfImbrrFHaWe6koIaOfRs7xpZY=;
 b=z5qdDJfjbT5uonpW/WqBvb6HPoJubZ8m7VVrP8Z9pfqOxT37KzOJZ6gxIRXfCIiV76
 +ipUMi4CQDKaMTiVD5+Q45LULnaMHbdhkIsQkOxd7WtfFMmFJQTwt6pJZ/vEzncC3epM
 bH+hbNxlAxcvGCDMsnoXicQTAOhWC7bpQv9eVF/+vWnIPqnoEQ68c8EWgjXZk1VfqzEo
 ByBNwuo9Gan94HBh3Yes/xu+i1k/mVSEybM8rq87dQ3n6xkZ6+F+AEzuijevykYMS4aE
 xqSIh3KW5Q3KmYGzFjraHnRk6x+hma4OC7HLxll8hgXlZ+E8TLfiy9TP6g8m47SlLXKv
 eRmA==
X-Gm-Message-State: AJIora8QOTS/IOjiYrU1hBfjf6GdhUUi13BQ8ec9LdhDZxC7w2a5EPBm
 TbJFsmjzkaMAgXefnm65yTHjGw==
X-Google-Smtp-Source: AGRyM1vBG8xyJ+oIiy6ksUK6rwiJB4h9TTzdrWLDcYP9XK5oslrB5xcWli9w3hX/TofWDYdMRlCMVA==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr19990953ejc.671.1655714680330; 
 Mon, 20 Jun 2022 01:44:40 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o2-20020a170906768200b0070fd7da3e47sm5525104ejm.127.2022.06.20.01.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:44:39 -0700 (PDT)
Message-ID: <93da288d-d6c3-56c8-676c-c5ed22de7bd0@linaro.org>
Date: Mon, 20 Jun 2022 10:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620010300.1532713-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/3] arm64: dts: qcom: msm8996: add
 #clock-cells and XO clock to the HDMI PHY node
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/06/2022 03:03, Dmitry Baryshkov wrote:
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock. While we are at it, also add the XO clock to
> the device node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
