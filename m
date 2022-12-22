Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9265402C
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088B10E0D4;
	Thu, 22 Dec 2022 11:54:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9810E0D4
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:54:25 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m29so2347238lfo.11
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
 b=ltUUyIxFmAaCCU3K8fji72mezO1sOZfzxlQy1hicVdGCCFEpK1YliunaefhbfBcWdJ
 4+ihkXYqnYePmqVq5a5O4BJKutu1jqz2+zGv2jI4t6LoT4nLPvUNiOU0rz0B5i99WkkK
 bygT4FMTn1zt5VmzT26PbjddUvF6jVOKRmFh/KSPbto9V/jYeOPfO68U/MXO3Jq0wBq7
 oFo7kW96M4XGvpeusRqjKGwHThoFk8tUuhsXRK61mqJH3iAo3ttp1vQJ+DescoK4u1xN
 WFWuTYzoDlLxyMj24g9fM0eUzj8iX0EkpTM/BND8fb5hz4UCgSg4HS9001LVZoob0HqB
 CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9EoBcFcr53BTbI8NLGBFcA7SGUwn8mmf9pGDxbWrjw=;
 b=Iv65n0K0K/Q6osjytXeIQBsN3gHj/233nEhaRXh8dr7of7RmTwPOOhmI1p4FMRQ1s+
 iiMajhc9IGamE3PHahmkdPpQzcL3ZT6IzMYkGi49nUiiU6R+k4TzDp3/8bA3d+EOdz3Y
 b1CbeTgJIujG+Km7PvxozN3D6D/CC0HAhq2wZZpmsHtF6eIHw2lnbijg+73TyOgcjCVn
 A8s04/qmhv5IprM3rjjSWLvlEHbjVD5CrximHwtbWv4EOuEWL0hk+eOFp+u/N7oO4nW5
 V7pm/YFfDQFDIMOPt3vhnEmmxBUgN9f5gYH7LdSfjXVLnlnTJ6dxiwkViUcNPxPcTEcC
 Tr3w==
X-Gm-Message-State: AFqh2kothFvQT08jvJADvYqa9k2DcLKmPMpnoknk4sSEdCpjPRz40aYK
 NS1DH7R811eZ0PgekWxZ0IidFw==
X-Google-Smtp-Source: AMrXdXuMEMS4ZAdZYRoxvWSmL5geV2FFazuPdHHRVejnluBwFSosVnViUal3BytGSYAMPvyirJ7lXw==
X-Received: by 2002:ac2:5e6a:0:b0:4b0:f376:225a with SMTP id
 a10-20020ac25e6a000000b004b0f376225amr1559959lfr.63.1671710063624; 
 Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bq25-20020a056512151900b004b592043413sm50426lfb.12.2022.12.22.03.54.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:54:23 -0800 (PST)
Message-ID: <d4962a5c-7fa3-e5d7-51a8-7ae8fc54e053@linaro.org>
Date: Thu, 22 Dec 2022 12:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-8-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 07/21] dt-bindings: msm:
 dsi-controller-main: Fix clock declarations
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

I don't think this can be on its own. Clocks and clock-names go together
and your previous patch already changed from 6 to 3-9 entries. Splitting
these make them non-bisectable and confusing.

Best regards,
Krzysztof

