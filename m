Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D660656226D
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FEF113C41;
	Thu, 30 Jun 2022 19:00:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D01113C41
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 19:00:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mf9so40861879ejb.0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5F6t8Oak8C6GS4yU7b7+HZc9W80825eLPQomvUc1GA4=;
 b=dyrnhxUVpeKETcOXlp8V2F+2d3STsBAJgY1uvPBzCsaCmAUn6hh/Vv8szNUBeaTgP8
 EBVGfbPAYX9Q10WsbXXt/HLckIE//XCkxvOGJ/ZfwFTxP06HUO/3+/dsts3cqlgnEMCS
 vwdRNHg4JBKQnPCU4xnOAkFM7YnZb/qx24b1AmCsNoyj8nGJbVRb1s8opdArso5ltr70
 pNXIvHONzd2+T4WsAvmrQD/CKG2MR9b6zrMzrtmmWUfyfcM+KokEXt99udexRw3pKuqu
 8AlL7t7stpk0X8p0PiCRPKqmWI5ceLwKQjPmA68k73R1haJHag0mTKlk3ZyVuLDCpVbW
 wv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5F6t8Oak8C6GS4yU7b7+HZc9W80825eLPQomvUc1GA4=;
 b=XvQK72MeoIheGRAtZVlzBYWGScBT8jtFRlHJDn86J71Pq4W/1G2me2gMfqrjre5KYe
 N9Qd5MsvTJv78/exeNzp2hD7Qc4oYByCNHGc8nLtD6CmntPOTvBmRo/rDluhyli4emkW
 os1y4QJ7LwsFuLLeWXBXNmdSb9hHw16Rk/Eggqck4JbCHUgzwT79w2ufe0zD2CI0X5tx
 TaZkSU5n5rXbz4kD7zBMB/5K7bTTXBL+pr9F2T8AFja2TxpORQ9PVmoukdMA8CSIAfAl
 xX5GiUqIu4/D2hvSJaQcqKnZyo8mDydvw7jobbAezFCCNVWFvGGt9FmY1/LVxYA0VdEu
 fG+A==
X-Gm-Message-State: AJIora/rcsWbD7IY9P8MHA4HiyKM0FZb2YGj84popLkyLAX/SaFXqfcw
 RFrtQO0/5jnEBDqvVCtmZuUULg==
X-Google-Smtp-Source: AGRyM1vb3jf+SbscLT5vNMXLJwsUmIX3G8k1DzkfPrK2EjrWsu9bAjYRrXkbwMHvCqRLoIe2i5R3eg==
X-Received: by 2002:a17:907:60cc:b0:722:e564:eb11 with SMTP id
 hv12-20020a17090760cc00b00722e564eb11mr10179551ejc.736.1656615611667; 
 Thu, 30 Jun 2022 12:00:11 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063c0100b006feec47dae9sm9389030ejg.157.2022.06.30.12.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:00:11 -0700 (PDT)
Message-ID: <02b93cc4-44f0-ba93-aefc-086d9373b6b8@linaro.org>
Date: Thu, 30 Jun 2022 21:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/7] dt-bindings: msm: dsi: Fix
 operating-points-v2 constraint
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The existing msm8916.dtsi does not depend on nor require operating points.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
