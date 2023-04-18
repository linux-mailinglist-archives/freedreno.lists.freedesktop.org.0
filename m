Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B56E60FD
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 14:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA62D10E785;
	Tue, 18 Apr 2023 12:17:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A74D10E797
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 12:17:55 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2a8ba693f69so18520421fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820273; x=1684412273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pm8kfo3XeSVwAetxgwT0FTokY6mXbT03bQ/HeaTO5sg=;
 b=BWqcSSa5M/DWIFNbg4ZO7UwMLj5VWEnGqqVHDgNleYwqCR1muKHmvjPz+dsv3fnn2p
 HgM7l3NZx/91bqWIEawAklbJXL2QVGOnYXVVVFVhqXENv1C0TdDuYJSAolh5BBlEZ0Z0
 /GMQTPZBJeD/7MkmZ333jRL+8Pci+PndkxJOw+SeDkZ7a3z6e9r4PbJgkF3D8BeYXLSw
 Jpl3cULrPqEgROuaQAndgzk7bPtuUEGIBViUYdwlLIEI8+z+IAfMETKw4lLh6wvUgswp
 D/QF24yUGT/4W28VMJMsOWCdfyShdXqgFMJ976ajfy0d2E7i7f3bASBD5qAKQ9yuNskX
 +v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820273; x=1684412273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pm8kfo3XeSVwAetxgwT0FTokY6mXbT03bQ/HeaTO5sg=;
 b=ONjfrC39IRFKBY+FeZz/ZdhcEfnEJg8DckDOSIr7cRKEWdDfBZk8xd8TEyRe89g5c3
 2/Qim3EoGjyfKph+stYSdYPLK6MF3mg4EEku9e94D/B0nSS55kj34YgWvfRAx6Bwm3w+
 oi8g57JYAYZGycVa1OF4tuRcwG0k6C3rzmgLO1vTocwqUiGczZHCIX+C9ZDkBZMJbsRf
 N1hWbi8x0/FZwh0odk9a5pU++DjA/EYJc7AhsqOS9pN/vMGVgCo7Q1gMEv/pyGx/zDnt
 zqz/fwRtG1RATSyazQo4hgaZ2OEwNPLVlAuCKcQjO3fAIwIzWvkHc7yGOyLlJX2wWkQA
 4wrQ==
X-Gm-Message-State: AAQBX9fL20IpcPfhhJG1fawyZeAmt6CdDZFepGFNFvvFkBk89YxDDYFS
 ICaDJaRtlr8xKu3LI4An09HhNQ==
X-Google-Smtp-Source: AKy350Zpv11CFVrXOJiJ6pDXhJb1NwLe8eKm9EyvXhDLS9nC5cGtz9y89V2oYVJtwOv8s5AcCLi44Q==
X-Received: by 2002:ac2:4a89:0:b0:4ed:c089:6e5a with SMTP id
 l9-20020ac24a89000000b004edc0896e5amr2759303lfp.23.1681820273493; 
 Tue, 18 Apr 2023 05:17:53 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a195202000000b004edd4566114sm109236lfb.24.2023.04.18.05.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:17:53 -0700 (PDT)
Message-ID: <8c102e7c-3ec7-5ffb-9d99-cfdc183acf19@linaro.org>
Date: Tue, 18 Apr 2023 14:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/17] drm/msm/dpu: Remove duplicate
 register defines from INTF
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
> The INTF_FRAME_LINE_COUNT_EN, INTF_FRAME_COUNT and INTF_LINE_COUNT
> registers are already defined higher up, in the right place when sorted
> numerically.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 84ee2efa9c66..b9dddf576c02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -56,11 +56,6 @@
>  #define   INTF_TPG_RGB_MAPPING          0x11C
>  #define   INTF_PROG_FETCH_START         0x170
>  #define   INTF_PROG_ROT_START           0x174
> -
> -#define   INTF_FRAME_LINE_COUNT_EN      0x0A8
> -#define   INTF_FRAME_COUNT              0x0AC
> -#define   INTF_LINE_COUNT               0x0B0
> -
>  #define   INTF_MUX                      0x25C
>  #define   INTF_STATUS                   0x26C
>  
> 
