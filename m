Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF3D1EBFE
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E866B10E609;
	Wed, 14 Jan 2026 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8n5oNv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5OyLNWa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F310E5B9
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E660621872428
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=; b=Tp8n5oNvR/Vtq7h0
 s0i5rW07+zZadJjA4M6DJhtHLgSxobKOhMHtUsN7Vr68Gp9nOY2ZgRuwCnkoutiR
 yPy9sM/sD2aTd6kry87EMhcx+TWEH+aMIr04oltlqr108KBf/Z0QBl/I+GPnt6K4
 VZi5CapUOJyrkynBYsqQMdvj2eXqRBjRor3+ALMRnVHlIBr0uK7hv++dUMsjzoU+
 QmaDGjQFzAXnphzMtty22l8jvj5WyNc8iyUMFjj2KS4t49Aoxa3qC5d5D/tjx+KL
 ApEzTnYT1wHM4bL+8AySWohl5z3tB3rQpXXXVVSfC3weJMiefojVnKoNkmkRHILu
 TKfBCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58t8eh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:29:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-29f8e6a5de4so80103705ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375741; x=1768980541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
 b=C5OyLNWad/P2vJEfBRoX7VSeRZAKPpWlNNU9tAi2Q43hd6A9XdMZnBWqVYC/ExGWLT
 tQPfJztNUKLV1iHoN6lYaDXmwN6y/AuHloKwZ1pYPxbw8BDdsIj+zekNg8Z/RUmdhHJ3
 B10p/R2DpudqSUJC8f/LKYKI9C1LoOuzbqsqqVYNJFFxY1SGAFyldT+NSVYta4kMVnL0
 CTk3HCPIWWSHCeDZVJFaIiNDEKZ2CygpLyHxrIuSWQdLSqCXogD2Ziufe5zoMG0oWmKt
 TMNUghVcae+4NKyh8M/vA6kIhTKc3HZ7EtAF5kQGKdEgvwksHJx1zIvGDlmncpkO62DH
 K3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375741; x=1768980541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhGxIZ9kW1OKAnMPXyr3he7wuhlzcR3uKNd2soiX6x0=;
 b=FERE5hsi1fE8e5N9iusDceGS/lRzacMH3gMWH4/54df5biTI6V9aLKxOGk8yEWqIuZ
 8wgi4YrxtlZ+AkDPFnt58IY4c5iFTn6lYdx/OAsMj1iLcpd6ukxQKbRO6ItpaB6PSP8j
 maIyxtFt4dLmrGTflr89NfDjTw/H/yo9HJvSFwkUefLoWqXpW5r4ltgwDy/Hptu7Y4Nk
 W71MqQ/fqalD48RqI83tLoxU85I456P6XvxMYcDou5YMmHld7DdOvPuLuCDm6rtgBavd
 JshVxKBVfZe8gGQk81kZRshr9JaL6fEQrL8i9feWZL4qpRJA6DJ8pXAUdXt2Q3JmacGM
 5e7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLOsHvd2QKFCiqJCp0bchspSIEjoK8hDmL4nTUakbgZ0WSHsjgZTsWDu4mIyN46y+DWOoMkViiCTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+8jxuyOa+acnsnCEBXpdmKKztCBwWrINCDP5eAQgCJav0C0Gw
 3pnMSwlt7Uq4HLC+wQwfrSamginwGQsQnd59HZZRim3Yi5lBAI7XmbmMUjKZiqmedC2Nkyhl9XD
 mdONKeZ8ailJ+iwKHQ8+4JXLMNQn5ZJ11oLVT72ZfXKzcma6IuVx0HPjfzttfEEyTKRLeiD0=
X-Gm-Gg: AY/fxX46NKRd5sElBJU2z3tLlBkbPzc4cnCYhoHuT/mueSKhhLY2qQRzrEMmBuJmd4h
 GIYi0cVCU3xLto9S636GoxrsA1pHf34cdyyY3a41i/EHdqpwN6VA9KC3tJMboMnqDLKXpjT4yT0
 T/RV3mYNExtqOu354Za1CSOnYsN5oNW18txBgma3t887UhC0OKFreL5ouWiUouPeKRnEsZ09S5a
 4NgikyPE6x1rzmXJ0MsT+At+IduVjqDl/PluccTANdvpU+Ov7g0XBLsrv21V+YBy70qfj35WAhL
 DfKX2b+gFBLzvvwaE8lsx1baBr//20OXs5RFwk8X2LHOvHpjs66S4yZruM02bvfbo37xzvCen6B
 GHf8vdLPJI3Zve4S/YDw3hO0biSPRRWVaTuYpOgMZHHpp
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-2a599d826b0mr20847215ad.2.1768375741543; 
 Tue, 13 Jan 2026 23:29:01 -0800 (PST)
X-Received: by 2002:a17:903:40cb:b0:298:4ee3:c21a with SMTP id
 d9443c01a7336-2a599d826b0mr20846895ad.2.1768375741018; 
 Tue, 13 Jan 2026 23:29:01 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2f7sm223039555ad.16.2026.01.13.23.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:29:00 -0800 (PST)
Message-ID: <4124d961-b262-c75e-5e34-01be1edf7959@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:58:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/11] media: iris: don't specify max_channels in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-8-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX1vVHKaVf0Zln
 qBw5tO2saavCUWMKECT3GDsOj40IR01+CBuoofF6sRJx/VxwiJ+yJdldRON4YvdbditQg22dwgO
 DL3SGntr5AoVTN7RLkKrLLjh7p4RuaiTeaxTkBpoeZZIImohW62vrrvRtBx/nM4gVXsUGD24Mb4
 sDZnmYicvnBXyzGwmxgeL+GISoTgH8KJUJicMiXSchsT7DmqMoY9Y/qZyoM8de5hwd80wi8PRPc
 3dCr6Op+K3focJIZ3BWs7ynBbJNY6VwKeM5rwdpbF3kx01llti5Q+37xvBpJivqnz7OcAsujvZ6
 X0P3dXjLzNkW6V3DCG857o0pPMQkhHJQ0mwK/foaa7r2rlIfSKLUolX+w/L8tPeHUX9nqDQD5oo
 +mIrMjFY5Ltjs8E5QCUj44Q7C73PqpCZdIH+y6e4Nq3hF32Un7KWlmEUT4gkqE632aO8ezkoUfj
 eamUg/SGtAlQPXQMNHQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=696745be cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S5pdipytwMNRnYpo3tEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0rmmrBte4-2TUBtb9-PHVg5R3XeRVagz
X-Proofpoint-GUID: 0rmmrBte4-2TUBtb9-PHVg5R3XeRVagz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:29:35 +0000
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



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAX_CHANNELS,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f99fcbb8fced..4abaf4615cea 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -72,7 +72,6 @@ struct tz_cp_config {
>  };
>  
>  struct ubwc_config_data {
> -	u32	max_channels;
>  };
>  
>  struct platform_inst_caps {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c967db452dec..e78cda7e307d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  };
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
> -	.max_channels = 8,
>  };
>  
>  static struct tz_cp_config tz_cp_config_sm8550 = {
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
