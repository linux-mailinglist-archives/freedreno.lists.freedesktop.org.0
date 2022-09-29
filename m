Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D645EF231
	for <lists+freedreno@lfdr.de>; Thu, 29 Sep 2022 11:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12D310EA27;
	Thu, 29 Sep 2022 09:36:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697E10EA35
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 09:36:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d42so1439022lfv.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Sep 2022 02:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ww6o0U2i2zJudwjdhnCm//cb1qt3k7L9xG3fGtIOJ0Y=;
 b=OSVXqv00/DBEjGvA0lWQtx0UoVTvunrlz3LSwOOhP1LROKbXDjxZwbQcFnBdn/q4hi
 fmXDXJlLPDms9ZLZZLyuSQ0atE2+f0w4QTrjLdi/W87F3QUTHl29bnNUuwcvz18r9z5d
 YEOL0A0SMER1G1NSI5AdBSxFsPlbaQzAX74iN/sm43FkRv/Xkd0pX88qLyCWb+xTjLZB
 iDqo09iDozXCNGH8QMvnasXxnTcsbAVtIH09EHTF2Ju6u9CGemeNBvorL4hUwMfLANXF
 Fr5LfX7Wj0l1XEm7aKwLZR6dYkRjWoLwmKR18NWR1p7oVZ1FxyigqwXKj+0XqZY++5UQ
 ybPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ww6o0U2i2zJudwjdhnCm//cb1qt3k7L9xG3fGtIOJ0Y=;
 b=giax+OkyVTy5MHG9mzkF8DZ7mnVcBLh0A15Jfxc4cE3j5QKOZ+zSybDQQx7s5LPyWB
 oTmbgwirlpsHtg11Gv4RBRYkjbI/+WB54cajeeIIzOE7stpf62C7ONzKVah9u/jCqcqu
 as1IsFGXwBX798Uz8avzBfErFVjHAFAnmA8VOZ9n/ullXdA8IL/LTmVUntjA3CKdYxz4
 ks0t7mIDIn9FtlD3DbLyfRZ4pFVeHbU+B87aGr6C6DcfKzKbp7o9PbXiOYzkkA2MUya5
 kWNizhhOa9IIs1ur3IDerVCcKb+ODEj2MSuNwQ3VfEoJDKpKUZHKhY1MyX0lazthq81X
 2/kg==
X-Gm-Message-State: ACrzQf2EINraQaFijmmOAzHWGsHcC3ZFajNUIlRw6w2fK+/n1h106F40
 WEfIll1QhO0XFfSzRegQcGBr1w==
X-Google-Smtp-Source: AMsMyM4Dy/g46rErBOUXB26zHgJUerXIox3jFEOJ+JO/d1gOihHxqiQK0J4+5dHNIj1rAVf/D9KgUg==
X-Received: by 2002:a05:6512:3f08:b0:4a1:af5e:5643 with SMTP id
 y8-20020a0565123f0800b004a1af5e5643mr1012675lfa.86.1664444194280; 
 Thu, 29 Sep 2022 02:36:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s14-20020a19770e000000b0048b08e25979sm733803lfc.199.2022.09.29.02.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 02:36:33 -0700 (PDT)
Message-ID: <869ac2b0-b643-310e-7b32-0e81edef6e15@linaro.org>
Date: Thu, 29 Sep 2022 11:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
 <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] ARM: dts: qcom-apq8064: change HDMI PHY
 node name to generic one
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

On 24/09/2022 11:43, Dmitry Baryshkov wrote:
> Change HDMI PHY node names from custom 'hdmi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

