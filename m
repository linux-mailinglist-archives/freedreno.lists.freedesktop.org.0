Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF2629ADE
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40B210E3F4;
	Tue, 15 Nov 2022 13:43:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92910E3F4
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:42:57 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id d20so17517060ljc.12
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCqAsBzIYqwnKg+sxRUK0clUHkV80l++z9LwleH3TLc=;
 b=AUHd9Vl5XP7LwggKtY0uN5sgsYZiCX11QgiYSD/c+2+rtQ6+Jout/Ghg6QdWN2Qbo9
 x5sSBRJ5fWqochfRzBHxwpEJ3eWCKo0vZ0EJkYX0sXssEZul7nrA+GuFTiRVN+Cc+drY
 zGeVJUBf4HXYPi+Ry4d0vSfJWJznx2ZPxGh9CAA+98EdXmjm17QHoPIHllnON+AA1NXp
 QJZmkTvQJUALIfdpm/INLAuq6SFbvq75Z2AYmM7cLD9I5q5qVrcWZ9hPZpbJ/T6fljgw
 CPm00n1HJQDmrJG8PqqJxutx3LaeUVa0R4f7IFQ6q9VZPQVnSDtV+kEn+Zw5muVgjdRR
 USgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fCqAsBzIYqwnKg+sxRUK0clUHkV80l++z9LwleH3TLc=;
 b=HS4kXHT8Skr9A2c20MTsj11azqPiwpDxBDc4ra4OlqTeQSr9ON42SRCBK3xSNkdmwL
 VrrnkTaxoJaCyB0sramoBIJGm7f1zJx16ZoP8wXOUimXstldUTF9XceeYPvksCPiJGFI
 YJpp0BTno0xCVadlNJRkwwsIrQJuoJC/oWYGShZfLoBeOl037zsOdIy6O5MpuVsUDEj+
 +VwTIOBiSdUt9kJe8sTiOHFNaqGf0M+8nriKypIU5yRY/haq486fCrCc+4NOTDBIgyLr
 h6F+lzgBFnjWhycniRYwAkvVTWj0QW6zce/8e/iFKRIS5j4aXcKRrf++MwpGblzDRKFD
 1Khw==
X-Gm-Message-State: ANoB5pkBqgplrf3LiXR1alX7c3q33OrcqJmDzoPCR9LkeGMkvgDDCRRz
 I+GIkvGMbwxaXIHOWBgNxG7Dow==
X-Google-Smtp-Source: AA0mqf4jM/aaIEgxVl/vgYByJ08SwHmGqaXCY2GmD+dfUWrVFiHIuOPXAH4wPeBOtq/q5Y2zoAogbA==
X-Received: by 2002:a2e:9a88:0:b0:276:b134:b04c with SMTP id
 p8-20020a2e9a88000000b00276b134b04cmr5684299lji.492.1668519775520; 
 Tue, 15 Nov 2022 05:42:55 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac244cd000000b004ac980a1ba1sm2215836lfm.24.2022.11.15.05.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:42:55 -0800 (PST)
Message-ID: <fed78af8-015b-e57d-76c7-68c8ba317952@linaro.org>
Date: Tue, 15 Nov 2022 14:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-7-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-7-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 06/12] drm/msm: Add support for SM8350
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



On 15/11/2022 14:30, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> subsystem unit used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index a2264fb517a1..39746b972cdd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> +	case DPU_HW_VER_700:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> +		break;
Shouldn't the second-last argument be 2 or 3 depending on DDR type?

Konrad
>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
> +	{ .compatible = "qcom,sm8350-mdss" },
>   	{ .compatible = "qcom,sm8450-mdss" },
>   	{}
>   };
