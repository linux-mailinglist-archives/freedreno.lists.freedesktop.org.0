Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08DD3B529
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 19:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06BF10E4DE;
	Mon, 19 Jan 2026 18:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFZqcpE+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnV1GHJO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BFC10E158
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 07:47:18 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J7PsKY3749193
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 07:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=; b=MFZqcpE+zDEkEljI
 eS3BEc+8YC8hC5WU6VnV2ZzFhUuBJIXceZxk4u1aUyaGZV7MVHM3TI/qgvDE3TVx
 d2VLbsmSY36B1G9MQMuHKAjTNgB1uIwlTu9k3oL+AXpELUMyDvEI8sGuMU9dgtSS
 b8jpEFgeQjIoorAOs8PyPxVgfkqWdnRhxUY25I/B8jK5yc8hCEJqgu3xqH6OHT3t
 X5fo/GvUdPtKdt1AtEuCHVWpb+s1JjXXVoHrqjPf6RUP8ahBjE/3D7PiO2Ufh/Ff
 TPkzm0JN7KKXihH0z/MRxItTixDSc1SrU9N7lzb3zX80yIN9yB/haU+8o5ha1foE
 DsoV1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79eh5p3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 07:47:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81efa628efbso3649002b3a.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jan 2026 23:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768808837; x=1769413637;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
 b=KnV1GHJOwCCtjl/paJzKPN1DfhS71mDxojgJLPQdR2+aDbd0GEXIOeVuvOJXTiJjjx
 DjjZILDTR5sp+hmgkyhWBJsx6rLOraxsm7MjvTotLROYbTleXVm7Jm2HC/Z4e7457Yu0
 XMOu+c8QJZOb/LM6I/OUHPYMQb3lqxJ2aR6pm52bqM+pgH6BOAvF10n+3KeQU79G0/XX
 M016iohuXWSk67EubxQa5xNHbWAqnOygzc1f5Bhro5KCT/zoQYanGeQ3zR8zrv8TNfny
 DbEP2FlpcIHdtMRuGja6QrcD6/pwku3Es5Y6zu6tgOPbiwkEkQbOouHHDOCd5NqVBLH/
 hftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768808837; x=1769413637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZ85mfqi41v4PyjN22gGAFMq8Pfu7GHfOSwVNtysSmo=;
 b=jN2PAYCEzNQFaceY2HuHz57v+uSUc0r1fU7ix3CWGYVxge3S9dSnC9VghbYAZPlovP
 cADbMY+pTIrmIulTLpPGwIGMJyzPflBdOtRJHszKKMX6jzTebKqj5XC+rbAD4wU3wP+3
 RoJ9Of91Dup7f7+dD1UR7eMpeoTlU3W75DU4IkxjrLXnPXJYDSKFMvozxxTzxoiPzR80
 VA/vekPPeLVJmg1ZJUr9YJ1wYr9joRhDNuwtb0uZulecCpX8j2M2H/irz2YsDO0/O9QQ
 ScfTI8MaEnne1tI5T86DNpf7VuMaUwNpThrYWf6OqOub/AVJlCJ8CBOJcH2b8ugkK9mM
 idgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqxxKjyzuqyEpTgoWN7u0tmiHQd8LIoxkddOeBoFQr+xMXqvaDRuyxIkXoHhSWWHcsAkgLc5/AISw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNjWL4uhQroM9Kym/JZSTmUzSoBINeM9uAUKtPywXFhcHMtYIr
 JUF7eqTZipOb0HegHZqDv1MLtjFZz9DT8H1gvS47bQp5h/ttQ9/seVn/YQNy9I6N2uMMlHS0g/+
 js6mWsXZ9b6bdwXxh9LDlIsyx6Xu+EBQNFxlF8QrPrgOZpONOV55BTQZ7+Fr9nqwcjTgURa8=
X-Gm-Gg: AY/fxX4oM53RSVJieKopPRSUIxuKcIbbe7GVSnLmaaBTtxAaVBxIYy9GrqioJi1shx4
 L/brkNGlzmZuo8Jb65MUH7HbNOSAifKhbY/wlkDeQvUP9ZohoxLLnKDrKGM2DIj2QDzt5ZyUqjz
 27bwJw0ZgDPEcikulY2xUNJe31D538Ap4oA+IHO3HFirhh9TR645XkEB8u6V4p186p/kn/znfJQ
 w6mzWqVaAOgstrnNLObtHNyerQse7hypW2nMPXjfkkVoQggvcA7+MJ5FkEdKwzpCUZ46wpQniKG
 UkniTByRWs1jJ+NCZ64vTRbdYo6wbWWp9NarztBUUJdQTIeqYrrs6hFgB0azZcESuzQgGGZvX0d
 V6pFPl6vq0C4TyNLOw7fPE8YChz2qkWJSFIZbOXDv2/CCgNG+P83Nde2O9IaqegM+47aHWhNR3b
 Iavw==
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id
 adf61e73a8af0-38e00bc01aemr10040417637.1.1768808836734; 
 Sun, 18 Jan 2026 23:47:16 -0800 (PST)
X-Received: by 2002:a05:6300:6199:b0:364:14f4:5205 with SMTP id
 adf61e73a8af0-38e00bc01aemr10040382637.1.1768808836236; 
 Sun, 18 Jan 2026 23:47:16 -0800 (PST)
Received: from [10.249.8.62] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf2330d4sm8657224a12.5.2026.01.18.23.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 23:47:15 -0800 (PST)
Message-ID: <08675c7f-3875-4335-8dab-eb0044d42b38@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:47:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
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
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MyBTYWx0ZWRfX9lG5cOHhfagu
 0Par/PyAihteq/9cW6jaWMdqllGZLqXivENxHlzLGcaVciyQUr2OeBE+6Dk2lnJuaBNCp4QRNWJ
 jPnyelyDxRhpC+0wvyaOMnMnU9O6TAyAQrJC7928mAp4UDQSMxPqVEubHPRHnRkEdKy7cpOmqZO
 cc8Oqg4GdoMBw8scVWD7fPIy6CGl3X5XZDCjIH5C8TXY8zpJbeoGSu/H2EeWZ6FwfEX8R8fegsZ
 Jh3CUEpRJ3QGwEf8OlvrftpxkHCzq4KaX0oM8+UHbtFI+PKap5gA8XUQmbSYNeQpWr0buNyTGLZ
 escjcJ34hTUNrI15LdXnh2AIPdXtiBowgAnEYdBWHlOUNzd5+xkWYAf28ddijk73qA5DobhTLCk
 mPL8YaCH55FqbY24E9+e4CKfAGmSsVYFgnIqwa18R+4/lylrjpznM/M9QxRxbwUL02MPpHwim59
 RZaVNQ4QgRKa7jL0V9Q==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696de185 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RKnW3nVSh4YJs2QzWIQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: _HOfdPfkC6Qoe8MKAer38Etc5oX981d6
X-Proofpoint-GUID: _HOfdPfkC6Qoe8MKAer38Etc5oX981d6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190063
X-Mailman-Approved-At: Mon, 19 Jan 2026 18:06:10 +0000
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



On 2026/1/16 15:27, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> Note: the patches are compile-tested only because of the lack of the
> Gen2 hardware at hand.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v3:
> - Dropped applied and unrelated patches (they will be posted separately)
> - Include printk.h, decoupling the series from fix picked up by Bjorn
> - Introduced additional helpers to retrieve the data.
> - Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com
> 
> Changes in v2:
> - Extended the commit message and added a comment for the min_acc length
>    helper (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (9):
>        soc: qcom: ubwc: add helper to get min_acc length
>        soc: qcom: ubwc: add helpers to get programmable values
>        media: iris: retrieve UBWC platform configuration
>        media: iris: don't specify min_acc_length in the source code
>        media: iris: don't specify highest_bank_bit in the source code
>        media: iris: don't specify ubwc_swizzle in the source code
>        media: iris: don't specify bank_spreading in the source code
>        media: iris: don't specify max_channels in the source code
>        media: iris: drop remnants of UBWC configuration
> 
>   drivers/media/platform/qcom/iris/Kconfig           |  1 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
>   .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
>   include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
>   7 files changed, 46 insertions(+), 32 deletions(-)
> ---
> base-commit: b775e489bec70895b7ef6b66927886bbac79598f
> change-id: 20260110-iris-ubwc-06f64cbb31ae
> 
> Best regards,

Tested the v2 patch series on Lemans and Monaco.
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao

