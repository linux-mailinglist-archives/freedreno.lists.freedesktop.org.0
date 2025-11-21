Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A0C7B8A7
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 20:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BCA10E8FA;
	Fri, 21 Nov 2025 19:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ7gDnR6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRAhkBzI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3A10E037
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALHJTcK3541521
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=; b=FJ7gDnR68uMEAyJz
 nSmtdm/8fFl8SQCkfhws3tHJom8LegtPc9xUeg0HXY/Ym9jxeBxuYDhnQNsNjJQp
 F6kgjqThSQw4xIWL3X3uFN0pf+9w+feV869TPxUVrgj+WrY52EpSYzT4YkuKbRU8
 juRQzVr9jKcGjnWMlY6v2ps7QAe3dSXd3LYGqbvgps91uckgtQMZ4YcsdhrafVBL
 +hdfXeoif0GRvOKmuA9UVE/ynjXyKVrJxKCPsQK3grhm08hzRGyMd+lvVdiIiapJ
 GC76S/qGACUJY+bR5U3umLVbkvhIqNjN1uggcfiguO3fPBrbPl3WXCQROQzkUD5y
 1qFKBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajng01urb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:36:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee05927183so5737741cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 11:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763753773; x=1764358573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
 b=CRAhkBzI0100aLwwcaalDQrF9hsMBf9OnNSyBj4ChDEf7H8oQsxu+mr4Ipl7f6lXzA
 MEOkmxW6tPY+T9ATbKZxw9q3DtgHgIsrr+TOy5ggC90H0FjuTXe6Y/Z2wyMpaILTAwZ7
 M2yPvV8f4+1yj7C/mvuGUCN+nR/48UM7wtzmZqqmRLMEYRIOPjqu66ssQ13UvENc7VrL
 Q42RzlK+p6b2TKQ7WQfCPCxdCpG2tN1XSkkB5GMmi5XIpl3mWVKBQNSkpHOyF+hmykC3
 vuubuMQRHtSn4X+MdtBqt6Z4iBcra8Zxvalllwm0RXpWE3FMywc11B66bTvS3pWapsbV
 3K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763753773; x=1764358573;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
 b=M4klRXado2Mye4C8o7Jvx15idDBsB6pXFyDf2IacnOPwB+vxCNHiW4DAQ9MKeza+uJ
 3S/IU0ZTAeH6iSe/+tmJqY51P0IsZZdg641Iq2IU0zLty3MJ+M+/IZXr8yHOTgV6UBM2
 klh39QSKzwGL5vepBK3+hZyyvGqq65CTCBxNKa1wAbfzzVg+U8rD8IFBD7hmC6S77ZYo
 tI1KPt+46zoJM4aSFD7AnzQ5U7ys1eN5rVI+829F3eshRkGwjDvPjv4ntk2ZUj/kYb5z
 ik9a2yUUNXaWO86BIRNlQOpxob3HxIzMfNUXZJWt0rXlEHD2DIGJX6+s7mhoi4r9Xm6a
 eaYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG8XbT9UHjX/FKwYtQOQ+GF3Y2O90bOYCTJdV09qCqz8a4dGhlcGKtmu7EmacCA4faJsafXaCndGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3f85ZOuDjHHZQ+1CrU2fPrQUE0IkJqI5xbyUOt6noWlPESQRY
 g2w0it60lv8fT4nk58CeWJqmcIK+yWg4qhgsfRUqtDyy1kp57zcPWtnncEy+2N9EY1aZVVaHJD6
 WPZARNd4eQCRc/mnidurGqln7FiyCnY4BcH/iac/j0nK2Rjf6bOLjTkpKrsR/0lBf5cKrxh0=
X-Gm-Gg: ASbGncskYmJf5/nlHXB4gG3rByguByhX9VrMv8nAOZF/SPJF9l7Qc81wjhamMSIijoU
 TmGyzTV7UcnszWfQoFllcPiWOoN4egYueSjK3mBQE8D/fibKN/57UaNcQ/f7IlNbdSyNIAvXU9V
 7NFEqt1UhHgaMHMYpw5H2GiFk+bkun7qUDRq8zdAsJvwvLfWB2OB6DgemUe2NdKJZXQ2nKVocXR
 IXpqtdh9wWmAsVwqZiM8deKhnsNCTGrZIhhHEvGviLPUJYyXqGDf7L2NtlbkJslR9p/30p5GmWe
 d1yzgl9ZjDSqFnGTSJQKacue30IyLvIde2nxMC90LDOfSb8rQTX3IENW8biRE9/2cVUnJvGN8oM
 9ZGo2LD/nouNQW05j8gLJ0whEBkNVZNAP2ctNjXvkFrVLjygDkKL0E1wRYZBm5OTjJ0c=
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ee5b7cd506mr25736341cf.7.1763753773440; 
 Fri, 21 Nov 2025 11:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY9s0z1teqxiBYPmhtD0WstyGisah3KpFja2LwxDn3PAOwAI9PpAIasklAbMLiLD3zuXJGRA==
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id
 d75a77b69052e-4ee5b7cd506mr25736041cf.7.1763753773065; 
 Fri, 21 Nov 2025 11:36:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d73e6csm537409066b.25.2025.11.21.11.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 11:36:11 -0800 (PST)
Message-ID: <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TNFhEK4TOmEkmyAThnN6ObU5dwh1glN9
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6920bf2d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=bjsXyR8rEHG-ykOKZpAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: TNFhEK4TOmEkmyAThnN6ObU5dwh1glN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfX8lTvNCKAVG9i
 osjfKv36QjJhBNcsw3mq43CmKLgyK83SUnmGlmAVjezHGhkQv23hXDUx4jxiJyKkf/kBrdy6nAU
 heONDaSTjvf/nFHY3qgK3E4rgDY/vCC0ANnWs8z6OUcPbB63ngq4ZmiS2umjamFJQjUNjU95cEJ
 Myo5DmnId/xmRFzF0/E42FJHnLZyMnqUMHNJQSXn/Zq76i7IaO2SF+Q2wPdiQdTHFC5JMHwAvWk
 i9yVUABINf5zyXROkfzAsMcdNxKId6MkmWyE5+z+YBbuE+YkdyLnYPE43JSkn2UpveVM/sDhWM1
 tn7MxW7jaHDHJSssRX20LSU+JrRAVE7jfHJkpRPhxzipQHY4ZZPwXhju3vclFtqQaHruIqdS+Pi
 zWo60RJVEHleShYU0NE8i33PHcWoWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210149
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add two remaining bits necessary to enable Adreno A225 support.
> Note, this wasn't tested on the actual hardware and is purely based on
> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
> require adjusting PM_OVERRIDE[12] registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/msm/a2xx: fix pixel shader start on A225
>       drm/msm/a2xx: add A225 entry to catalog

Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary

https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c

Konrad
