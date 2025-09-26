Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF2BA2492
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 05:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A04B10E311;
	Fri, 26 Sep 2025 03:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY0hQEii";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D304810E02B
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:02 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnqE000846
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=; b=IY0hQEiiUKjWIxlz
 GvvGIamAvxkoqk3lbTXoYxuP4aHFIE9UWsA7aAy+slvo7FTwMZd3gfWIg6hU/9VH
 wCBQjhDxjZIfKR9tKWr8OvDiGSauCiuPczfoMhEFmBnozzfPhq4j2UPHP1DECSgH
 0CtqodR7Aw/J+D9RB/cNu9rjWTofNI91RD6xrxELmyKZV1W1xobgA6xhH3P/owRc
 wRFheeh/xVhRrPERbBtch9dShWYLyr3b7eUeta6VVLFMWKWZKhQLn4nUzGPAQXyG
 aUg0r9zWQebI/yZVwWdcfHA0TwlBrpRt7u46cG0HTs2ZaP2tcs9n9mJyb1762b4M
 C/+Zyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0ts5bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32eadc2b473so482191a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 20:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758856621; x=1759461421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=;
 b=hTckla99bV6+QRp14Omj7vlkhymV9DrMP2ydrt4ZpeVIfxVH0b9GgA0TT3g8rLzH61
 rer5LpFchxpAORPrbGseS+yQAldBOqYPX6qIFLJTT/nac7QKcQb6X8i3szeGG4fk32KV
 hFUhLpuFMa3gyB+fmKYXuJpVXNSZjXAda4QgQfDX44s3xP92is/0Izlh4TREgfFZyJ3s
 1hIiOLB7HPjoIZH/av/+RzgpdqAz6Wsz7L+A8vgs7LKufBbtdnnjd3ESuJKD9kg/HPlk
 FV1HQ/P4Tu9vn3IJeJn6/DEiPw/IeY7ApZm0CiBmRHlhJAngO/bnnG2XtV5eynCp4P0y
 y/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6dF64dNBJBErD3rjQgK2jmeHm89gcX8Zipi20HEmZuE8UJgiIgwQl7XTDbzyDwi5tXYvSiA1Ts0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKhLTRdmsBpw1DlRtopsyMRkxenEgl1ZqjfibRHO+DGmogbpIZ
 fd0X7uAEum3KN8+OUrm3E1zt3q/wEiibNI07HSvQ8JAJFPRaPXnnt4eCDkjNzrqSXNOXDLtGIUy
 PrfkhueyDh5LkbNhAtvqnan2LlLLeybiCTuIyaqgIW0aP1U0N2979roWqbNcyBQ2nee6Ik38=
X-Gm-Gg: ASbGncsgMhLDhU/9CBLr3jjVrUEGO7r3mX4H6Vaw0RJbOb56IDI09vUU9hkYyb8xnnf
 mp12UM6VxzF2A9ty/lcW9NEkBed7SewOYF/aEb+jdDeVW8b5fTWcZy6aImiXZk6z2QiSNQJYBIp
 ZCA33FzZr+o2HajEzpLlVlHUYGCKdWkKq1UrkbFpFquWiK06z0t1veNIkQXZYTH/yEoXoNghqC7
 lJLiaB9aeB3fu+dkVlKHA3/buWILLrqhazpYZDN3YlPPL8gIkqHUIX75W+LytHlwICN8S3+loqR
 pPcHBCpoyhxgDLNh2H9/x4XLxySzy+SZ+TJLmbpGH+Y3BxMISRFew4gTu5nKTTUt7tPnnfWsV6/
 8+Hbw9dZR4E8bxcwn52DedPuaHcncBVtD9qE=
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id
 98e67ed59e1d1-3342a17d006mr3998872a91.0.1758856620635; 
 Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiqzLmVD4byJpS81rkUiJ1Icsy/ExxJQYHMvD+WEtpM3r1cCrKQQ5MrCKcNruiodugOB5rJQ==
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id
 98e67ed59e1d1-3342a17d006mr3998835a91.0.1758856620082; 
 Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-781023c203dsm3184336b3a.22.2025.09.25.20.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 20:16:59 -0700 (PDT)
Message-ID: <2577fb3e-96bb-4f2e-871d-27395065ef4b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 11:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
 <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d605ad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DA7DBj9iRjnvuWfEG8oA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2KjeNtdDzoskr8C_OyVqD8j6SZLMHLLm
X-Proofpoint-ORIG-GUID: 2KjeNtdDzoskr8C_OyVqD8j6SZLMHLLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXynV62j8DZnJJ
 RcumzClH+jmU+8r5NcTGFnesRa/o25i1u63Cl3cA0L0cJr9alM4jgRs2enVlh/5WKEkGn0MKwiD
 qJLG8K5p4s7dNG5eeZvU+kE1ySIaIYE7U6Q3MfsF7SI8rroy1DOTVVjSRDgGpur0IkuJaP0aOOP
 mR+WAdR9vmMn4mPrT0Y1rnCyxgZmldzB5Vs/oEqddG4RndumiJxMg9+Z2dcjZfyobhlUtxdlrEv
 uFTXn+87iCwc3M5YI5T/YEBVxjNYzYhg60S1+mhPT1qD5/eQ6CiFoydCB53HMYokvN0gOq9Mit3
 6bK5zYybKSeM0pdMRBxxRc23dPw5RpBf4Y8H5isXXpV1J/a/PgVs7gtAtjF7E4FPA5Azxn7VSmo
 Q5wz3oAkMw7t2BkwfrmxESQ78uLqEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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


On 9/26/2025 5:57 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>> routines, voltage swing tables, and platform data. Add compatible
>> "qcs615-qmp-usb3-dp-phy".
>>
>> Note: SW_PORTSELECT handling for orientation flip is not implemented
>> due to QCS615 fixed-orientation design and non-standard lane mapping.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>>  1 file changed, 407 insertions(+)
>> +
>> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),
> Hmm, I just noticed. This register belongs to a _different_ space. As
> such you can't have it in the COM table.


Thanks for pointing this out. It likely worked before because the default
value (0xc6) was sufficient during validation.

I'll move this configuration into configure_dp_tx() and set it based on
link_rate.


>> +};
>> +
