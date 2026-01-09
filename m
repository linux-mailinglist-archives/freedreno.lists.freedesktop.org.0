Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5ED08202
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 10:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336F10E851;
	Fri,  9 Jan 2026 09:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxoQLUak";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+mecLIt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6D110E851
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 09:13:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60952eE03542035
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 09:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=; b=YxoQLUakCVzeOh88
 ZqaK/OwdfAOF9sIZtVbbMX1FqVVQRdPVRy6AA/h/jNUsiKRnj8fw8zBmyc20k/3I
 gfkZ4sE1wlKql3l/BpUpXDKIOrSKKYiF0bxso7vZcnl2zK4Dx6sYxeoBprpe+IYv
 RQHzKrsshZaR4ZdtvawBNBJtgtJKWtxdvuvqajbUJeSATPZNQTMJ+jfGqbDhBOwF
 KKl8qlzD3tEo1F9xwTZimAxNBOMMUfd2DtakIxa3FohJyBz4F3KKeWAtN/yqxv8b
 8LFSP/Cz1LwjmALIpsQLPUuu+l0MYZMlZly9QTGkSyjKZmMziEKrB5X1PPVqJEKc
 NMvsKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b0ph5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 09:13:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b9f3eaae4bso94010785a.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 01:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767949980; x=1768554780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
 b=C+mecLItBAaBsyn03A4FJ1O3XTZgDbL8ii5rfyk9iszEp6fIMwXCsKGgx68EI69pA8
 oqzutONyQ370gj/n43zps3P+hgn3n0C2ainuVKV02nJVKq4wp+QbyrOb35mcFOk2W7g5
 s9MBVMk2Vwa5MaOY1eNX0YPhpdP9plDTVSPt7/PgE3VNzE9qKjiXMuAGRyEuSYFpYfCc
 iz0vZnCN8Ts2E7OHGwWRhXAWjm/KZepKxTIwc2eFlvJ6QF6+7aI+sYhlp3G3WAVrXp8r
 NWkpGQCznlE9s+wYbXaxpXH8LUuy74ln14XujXDQsdAq970N/DrmdaBmzG9k2Uzdm8Hz
 cLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767949980; x=1768554780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1P93m0XTzLapwNrcaQ2biPDhM8Asz8miZJjKBvF7vq8=;
 b=n+39SRli6SbFiv57CPAZ+R6q1Lzock0jjKiNoin1C8+hIFyBPrq66PSELRuRoro6G/
 fvppzRasy20eoEloxlJ+zufiw0C/W8gYYC4Edr4mjc7XJ6iM92q8GV0s1hMD+wiTF4zJ
 X+lr5qj2VVt/nIWhMuEcqO9qNWw490svYoNRSTetSRMj5E97DcfcTOzrMuCqhbltW9vq
 Oj+rH8PpWBEB1Ms6XdXnX22DXGHGZI1mAtCoFWwgJSH2/oS+nwiw5l7faOA2fw+rIl7W
 dTADKesRzQcMsFHe27B30aNfSalXADHnsYJfIByElJufaGmecxikYccI/HoYcH2j2tKl
 aohA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCCCOkVR2NP7pvJGYdTlO6M25hdKHE9ZdsY3zMsRY5pTxelQktGb2GuU10+dxh9xWfUhUulfoVfZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCk8bCTcKTqaBvC91n6//E1in8TWz3to9amFSM1LEyjqIp1vQu
 6F45BoyJH2ps7cEO+qMSYiRE4XLZ2SOKwkF1HJO8mwyNvP9ECqi3N6uy48WlElMhhDb7it5yEcd
 L+tLcmqapN8LrLQTrQ4sEZs9O7cKSBz/ay5l2PXSZ+TMIfvnDXVP+uQkC9QmD8jPUNa1kIqU=
X-Gm-Gg: AY/fxX74YsPTu9Z7Fyfq+dq88KF/erZzxgjsVAz2pxnMSOltI6g9PitoXCRUmBrFHB1
 2896Kx45MCjrEDoq7BMJfeYhZQeygLlj5t18iE+pPXkt4Z73g2g4kbp68GMSIeoZ6lOD5IARYJB
 v2vMi9qYRCrBW6kpjy4CmoVljDYs2PPK0JHfhwIZw8CubceBT0Qcvcxla2nnwpyY0s9k2AH5VVU
 DDonL4cIRscWTh+Smx4mSeSE9tVKdlodT+UfrVF+oR7H7tdQyjDK7nMvFxps0MdPOfy+4XO/tPx
 HtU0DSm8C2KhlL3bF136s5f8dAQvVbxuF0ZLUAc8OhCkYsrdxhvxFPb/szVo3N46n224aXy/Cws
 jmZdYFj52XAyvaeuwX1J0m7t72jP/B8yaXBbBqBlNRC9zzHfhpktheIU33evsYGLvTOI=
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id
 af79cd13be357-8c3893fd6f5mr926315385a.8.1767949980578; 
 Fri, 09 Jan 2026 01:13:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeBZSG8kdSBLShp1+Wc/UybzJzIr8kq9RYBBSnMDG9wd87B0tyDpTBrTpAW7NtU14bEKYlTA==
X-Received: by 2002:a05:620a:2847:b0:8a5:2246:bc29 with SMTP id
 af79cd13be357-8c3893fd6f5mr926312685a.8.1767949980148; 
 Fri, 09 Jan 2026 01:13:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5187afsm1043952666b.58.2026.01.09.01.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 01:12:59 -0800 (PST)
Message-ID: <faf2dc8f-fd5d-46cf-8572-41879b3f4aa4@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX8FH18sM53Ja4
 cNG1pAY2Gywta8Aa/MhFtbAjI2rfZLHz60dbd2u/GLBctWkJxLUwv50cVNwUIPItzj07XQe2rII
 C/tQIlHmSB+KkInoP5OBhL7NG/2ew3K07k+YuBwFlnYxGDFwtpJiSrM7JFeIrI8jtzKADVAtTPs
 rkWYI3auDFWJzq+ySAyPyXnIeY9Yc8O/v1MCxKBm79P9JCxyWOOScKXjBRe804Oy9Zg5n5/1d/n
 RE3dliW+SAtbhgo7KFZa+EK+MvuzosgNYg2+AWqlfVlAKEtkQ1CqLxHoqKACi6zcv1m3Unc1PV0
 a02Ta++Rm5SN2jvxbUsY8sz7wZI3Ms+mgQ/JsZMBuaC4EVqxOo1qbUTbn4O2RV6cbYfbK/r9V2S
 Vk/kQySNL0vTVodFk7kg3OCI08szj4YVhVOQJQphyq+f7le52yy+iUEzAvMmLI/+beqoTzkt7de
 4plnsEIkb9x5XVz1SCA==
X-Proofpoint-ORIG-GUID: wv9-cvzJqAYcN-3shUFgzzfl2jK2OOhW
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6960c69d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wv9-cvzJqAYcN-3shUFgzzfl2jK2OOhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065
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

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

