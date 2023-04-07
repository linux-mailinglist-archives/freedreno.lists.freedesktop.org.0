Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E56DB0A5
	for <lists+freedreno@lfdr.de>; Fri,  7 Apr 2023 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A7910E769;
	Fri,  7 Apr 2023 16:34:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7010E769
 for <freedreno@lists.freedesktop.org>; Fri,  7 Apr 2023 16:34:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g29so5221535lfj.4
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680885244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
 b=mreYxKmu7Qa1bKhb0dlbcqmjd5mvNHJiWaY50cJ10nht3hVDars6QEXLXzT6VTsJe+
 NvVwJDMppTlB2XpvB3ZxqP5pz6ETnaX/4XvIuNlnmI7VIFE9TKZSaXfgvE8Boh/0JiJV
 l62T2IEjQpJY8EQyoJ9qObQzFizN+JABL6NRYPN9YrjyusUlbFxAM1AxidabgyB5SstI
 kffiZ90QekZb5gtEvxxh8fPCzr9aTMafRzNCiXFSosns5x10+pkllVVlliRuvMdyMuu0
 YmCVSUyZEdB7pRWpLR+7IqAJtFlhckngThMwZufS0LjouQti3UMOzbmhIMtbVDha0oTH
 YX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680885244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ns5LOSHu/7rt5El0gaG0VOdBa6A5/wehdLEQPfWFNHE=;
 b=nGcMHAFOHYYzpCAg7Za71aVvUyZZ6dxvj/dD68liIqc9SNstgAcaeb3JJ0c4Rt+CQR
 3RVEnB1+677g+Kj0xyhDi3fWwdqZwh7uhOILO+Ww4YeV/N8ExyqzqWGHtLW/nmJuQPA7
 L9zISwzfuW12nNGPbbG7fi9cKkz5/jCBzBOw+CDu0Q18DP8JI8gKb8lJ5tOcE+fQ2k7t
 I3mXFbF1BDxwx1lpcJTnNgB6eNJDSa0WvX7r5aSlAra23E7lSBpTzTdV6IyvbeSiVuei
 S4zX2IDPIdT3AKA4fgn+sWhDvzEjYixm6XDc2fbITLVPL0CZaRjclf6SLOQp4Gapa8uc
 xdyg==
X-Gm-Message-State: AAQBX9eu+OygEhoAeBRlsh6QnevsfB55dhvqXa1QU6tyLaVZWBfTzKG9
 xnsa511O/HkmHDPnUrc+t6EkQyViAWGBr+WCqhg=
X-Google-Smtp-Source: AKy350YiJHTNXXb7fD+W+VfSVc1OojuyNSt8JSxB25sutoPPaP/XveG/bQwJt4kq/eupW1E01yk3yw==
X-Received: by 2002:ac2:5f0f:0:b0:4eb:13ff:6ca7 with SMTP id
 15-20020ac25f0f000000b004eb13ff6ca7mr791005lfq.16.1680885243956; 
 Fri, 07 Apr 2023 09:34:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a2e90d7000000b002934fe524d2sm894103ljg.83.2023.04.07.09.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 09:34:03 -0700 (PDT)
Message-ID: <7745f5c7-9dd0-3010-ae21-b269e059620f@linaro.org>
Date: Fri, 7 Apr 2023 19:34:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230331221213.1691997-1-markyacoub@google.com>
 <20230331221213.1691997-10-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230331221213.1691997-10-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v8 09/10] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
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
Cc: devicetree@vger.kernel.org, suraj.kandpal@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/04/2023 01:12, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> 
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
> Changes in v8:
> -None
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

