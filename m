Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DBE9FB077
	for <lists+freedreno@lfdr.de>; Mon, 23 Dec 2024 16:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFCC10E539;
	Mon, 23 Dec 2024 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJi1iZim";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A2610E1A4
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 15:02:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNCv1Mb002438
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 15:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jOueQRrVOdVdBWKPBRxKIz6jCEFS3rdEhZ18GsC/lhc=; b=EJi1iZimqFrk8pL4
 0Z7jnBsgzo69O8LRaWOYiWzbsY6zNDwEWV8U/WToThuKWadCoLsOX/ZjzTlYwlRC
 +3URRnWvvH8r+fakvVOJPSHQzVXRwlTnrFzOPOJw92H+EcsroAoU9uPmJuPcMHyx
 BBymPLaPW9JWiNSd/lcOkl2f73wrZYutmfkFsttN1992BeyYRrwTpO/1ixjzM6GF
 CYTQN+FW6fHHKCCP/XU/8Bp3Ld2id0fnfqxQ+Do617U2FckWY2cqBE7VZWmTXz2i
 nw84c/FlXkiVKE9OF1Ng6hvp/qdxMAj2MqxgISDkF8f/7G56GKg2ZdC8hogN11yx
 zKrJww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q8ah8ckx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 15:02:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6dd0d0e0604so7559626d6.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 07:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734966139; x=1735570939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jOueQRrVOdVdBWKPBRxKIz6jCEFS3rdEhZ18GsC/lhc=;
 b=ax56C842svTJXVsjhxSTpp4amKFpYyDZjLiJRdgo7AXxdwTVeXl1qbtW+FLLIpNp88
 rhjycbEbF0qbBAbSVOKCp3eVw1uqzBkBfT7ftMlKt/NFHjNyXqNiA854HAQNdPztE7K8
 +L1eVcUzzXxEwKKsx//GPTgOsN04MwSnVXehkXh48gQnsNDZtH7jFGWRiSZLjB0ucYRg
 RCk8Y/vX24wbhu4RLItXobcxpE/L4l2d+c8x0ZG/Dxoa8MOnmPAUtVyHg2acX/lo4344
 0zsCJ36DHCXpPLNGuU2GFRAew/2BHRTENrKxDzlNL8vOKSTKIkZLE+ykQei9qzKYIybg
 jEBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeA+CDxNFCo/Jn6nejRW4mCqhM1zxvdWeN+Vh9vdt/ugMNRoWPjdkKbCSosNOSgIay/kyzpaNbm9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUyzOJd583o3gAc8V7sfTSOPsjIpkm15L32aBoXZ/qXB2QjNmO
 jZam0s7+fz/znMHwDOR4GlHfsGz/03XiUz/5cPwwTZeVfJpFdg36eKFl/9Kp8Z8LAf8iHyjs7mJ
 ecGQ/pJCZgxTX0eeyYdLHjYOVMHo0EYpIq0hHtNG6UhVwQBwn0/SuVZJ5Oe89HJY2/So=
X-Gm-Gg: ASbGnctFGDlaHmhA/wGJoCeh+fEDiwWxzRsejw3CTKvoD7AvtEza18exn6UaM2IW/54
 nJmStE8RRZKkLTCnAqX6O7+o/3omJTsgnD7LcKHssn4Va0RSa+CH2w+jTH92hYTfxz4gWgrsCEY
 1RmBnbvYYTCNgfVuyi/3d5V7ZGcPG0z/79PwvyWc1ogajqxa6upw0nk6/dcyvWGi3Dssv8fcNBq
 gUSzAZ6JXn48c5/YUIOc2deRputte/Dko+MOf0pSDAVirjVyNbLbWOwGv+2LhQ+a83qaTUt+uet
 OdzZprEt6zuy0zEAsCJic8jwjwhNrZfVz/k=
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id
 af79cd13be357-7b9ba742c0cmr820184485a.7.1734966138868; 
 Mon, 23 Dec 2024 07:02:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHREjQZz+CVTbzd5TYeq0dnl7WV9RvuT6R2vxSIAg60SPUsaB/sHNZeP/tyzrWvz3trjyaRwQ==
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id
 af79cd13be357-7b9ba742c0cmr820181785a.7.1734966138353; 
 Mon, 23 Dec 2024 07:02:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f012229sm525618566b.133.2024.12.23.07.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 07:02:17 -0800 (PST)
Message-ID: <f07d9efc-fa3d-44e2-83f5-621ffeaa9f91@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 16:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
 <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-3-1adaf97e7310@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uidS1yG6XFG9GsGxj7lpgn6dwbjpGPX_
X-Proofpoint-ORIG-GUID: uidS1yG6XFG9GsGxj7lpgn6dwbjpGPX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230134
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

On 17.12.2024 3:51 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entries will then be used by the GMU when passing the
> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU
> +	 * The 'CN0' BCM is used on all targets, and votes are basically
> +	 * 'off' and 'on' states with first bit to enable the path.
> +	 */
> +
> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_num = 1;
> +
> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->cnoc_wait_bitmask = 0;
> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->cnoc_wait_bitmask |= BIT(j);

Still very much not a fan of this.

I think this would be equally telling:

/* Always flush on/off commands */
msg->cnoc_wait_bitmask = BIT(0);

with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
