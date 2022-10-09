Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FED5F8D73
	for <lists+freedreno@lfdr.de>; Sun,  9 Oct 2022 20:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE3210E096;
	Sun,  9 Oct 2022 18:53:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944D10E533
 for <freedreno@lists.freedesktop.org>; Sun,  9 Oct 2022 18:53:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m19so12462002lfq.9
 for <freedreno@lists.freedesktop.org>; Sun, 09 Oct 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pBU+42WDJEw6kYLIwt2kumcImvZMC7HZo1MXSpkSR94=;
 b=jDJ3EXLInv+837QzF0uKei/b0nAwTmwMivjyWNvCSqsaUS5uGhZZ5p+9jqAD8B9UlB
 8EdqhKcYmnv2hL2QCErhihJMyZC89I3f9/nawFnuOCrl9PWS4h+5E6ni6rRBnibTZnsK
 v/9HwSotctDB0P/t9DvGueCCURctvR2IZ5zRPxT6vptb8gZoYriT45raWFk8Jz33QN0n
 K3p6q99y/AZC8YwNtpEfMkRE4ukJTFv3r81u1OM0D0Tgahzhn/K1Z3jYZJFTrQjufJDy
 aCwh5EMRWN59hWihxffQwUdCLGqdq/Y39bod3Hx0ZeTSNP6IZmQM8l88zVl1lJp0Edox
 2jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBU+42WDJEw6kYLIwt2kumcImvZMC7HZo1MXSpkSR94=;
 b=FhCaDGEniMFghchKQLjTbovEZXxlgc8T+sJh5fLFnqr576jIUa8Vf7hhQ8IPHgXI+3
 Mm8OfHYp1685UzY7Ik6/5YfZOiDaKaD31GdUFAQ4iDwZAKBbAdBXxYFAdMHSyXRO6xm1
 TDA1HOZEhFjDG8W+N4EPR+CRAlheqmF/v/NdUIfqIOn1EpAcso9hdrhpKwFWmJzf+evP
 4Mnq0Kh7WlmmCqKdbzGIVaD4y56ICT3FkgQkNJW44UP/unWNg9++wuu3XPJ3hnWLWUe8
 OixfVhzjmhpEu4nA3bUmUFGzLrk8VjN0wWqEFaUPiVKft06BAyuS349gRpeVtFa7ub2E
 gbDQ==
X-Gm-Message-State: ACrzQf1T9KAuKgeJrMllX6eAtE8fxgU2ZwGl0kUW5jrhs4+utHAGNwlB
 j0gfLn99fxH0MLiPxdn9ZbQ2Zw==
X-Google-Smtp-Source: AMsMyM5aRVZkqZutaU0TMyEyIn4HXU3OyOVthzdxUsMrTnMrF4JH7w04zVBoJnyuKWcnF8FF4wsqsg==
X-Received: by 2002:a05:6512:252b:b0:4a0:5642:dbc5 with SMTP id
 be43-20020a056512252b00b004a05642dbc5mr5643306lfb.436.1665341588751; 
 Sun, 09 Oct 2022 11:53:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a2ea485000000b0026e059a3455sm1367718lji.51.2022.10.09.11.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 11:53:08 -0700 (PDT)
Message-ID: <f3d9bfac-507f-64e6-bbf7-29a3d9dfef31@linaro.org>
Date: Sun, 9 Oct 2022 21:53:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 02/10] drm/msm/dsi: Remove repeated
 calculation of slice_per_intf
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie <airlied@gmail.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/10/2022 21:48, Marijn Suijten wrote:
> slice_per_intf is already computed for intf_width, which holds the same
> value as hdisplay.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

