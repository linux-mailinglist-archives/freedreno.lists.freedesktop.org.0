Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028CAB1355
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A510E971;
	Fri,  9 May 2025 12:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YXDI9J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E2910E2BD
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:29:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C24Zm016832
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=; b=d4YXDI9JVT/RdlR1
 GdJC0wS2u069Epw93BWciJUdMIKF3UNJ7Xwwp+e0iyfQJacs+XFNJpL7CH9rJO2j
 oFvLXzNuPJq2ov5je25KP4h2Y/GJS0ZLpSd7jcSq+zh1nOFpSX8113NNCllxYy37
 2Ry3ETq+cJxlP9igVJeqN355DpMucEY0C4iOGvfCKBPS9wmoiLHvPULecANXfHxa
 Om+VQYlM/ZtEyade92RrwGBOqCpgHhwwH4se8hgL8oFQT8VhYhfLQtWkH3nB6zAY
 7BPdecxDiL/ZuFaVNV9b0iyr5HipcNjTqOogpel2QAg/USc/Y3lO4FtjZxZdyLpO
 O9DJeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8vkjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:28:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-48f812db91aso5209971cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793739; x=1747398539;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=;
 b=oBbS11SvmWLwpja4MP2lR138N5kAtEdetRYpL4+i40odm/QFEC4FkbYI9QeudocssQ
 NIz+u6HH6gKDPLt6UXWBASePFS54o5uyQNoAtvXFx5YTAkdQieaFoOVQmcDQt+I0F8Wa
 fmZonM/JDH0i8BBSQNtJ9y48jQSwblwLZdnbltuB/Y/UHnM6lTlX8qyMSgUdhgp0WFCy
 cs4ExBFTMje/IK1xajgdImju4A/1tBYVlXK01N2pa9jdJQf2KzNeHvRiFKJB+y9DyxGp
 r6y9Ox34D9k5qcwxV/2R++JAHJlJU9KqBj2dYNKhmes17ufWoqbLogCDTZetZuOikut9
 7uZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2xqCDRkcd/hFxMBbj8QJRxfNYlrI3qxGdgPM9RGZmSc7bOXt2H85ae4/wDUjbLVerqD6h3dh3kxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDLy8XeXY/QdhGAxN8ZZuDylKUZNDyzqfnV6gzI1xXEB6sAbQj
 EQcD0sgZWX14agbzdcEhoE0+PNoh/ih/DmWJRmhZZl6i6ORcmf8DnZk0QYpUJL7pfq7NphH9ZZZ
 8sp3W4DgOmRfQCWohzNMf8Q++AimmXK6g+h9oqY8817pbCcNSvpR8g6ij6xxDP3HpkdM=
X-Gm-Gg: ASbGncsnx19kwV4xWzEmiI3jtiwNiXYYZTW9m7zXjYMYdyqiloHhOsmNj6bORcpA4jM
 ouQSoWrGZdpf9KkSoI+E7/5HCzu7TxBS5ArPHMzkAwxpxXxSA4aod/i4gWrNkrP0eR5JBpRaSej
 ng3T5ypuLydW+0obUvJtTuT0RXo31whFhpnIzsZljNqTV8dqX/RaTroUemUhXupMwUvUQb/ikRO
 1i93wzudPYZKawW09/TQGor0qCAtrmAg7uaoQFdMYcynO4W2irP8q9szNeLpLhw7F0y/7eHCPbr
 XZLcUdaiVveI59kzFXwGH17UI+R2iUmfEQ/av1ZAvpLYA8IwxAA3GsESbWhPGkoO7Jw=
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id
 d75a77b69052e-494527627acmr19924191cf.7.1746793738939; 
 Fri, 09 May 2025 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh76kBlsHwWwCEVlS+S1ABlxGBvnfq9t4dYT6eIbKcDYDcf8Gdr8WUiN8ExkgtpWuH7XTO8w==
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id
 d75a77b69052e-494527627acmr19923881cf.7.1746793738374; 
 Fri, 09 May 2025 05:28:58 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a442sm142986366b.82.2025.05.09.05.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:28:57 -0700 (PDT)
Message-ID: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WuE6sLtNQLXI7hwMzqk_JkfUHafI4-4a
X-Proofpoint-ORIG-GUID: WuE6sLtNQLXI7hwMzqk_JkfUHafI4-4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfX3dJ216vqklGB
 2IVxG0lwF0DkqTdUgnYhN25XYD8FFkhqtrVHe+WpPO/pI2KonYAaEfOvjhL9AJ5NcS/ChTtYVte
 95X3ei02hYKVzKUwuWIeWpIHv6X5cKkXn2TS3F4qurd96CNTpZ/d3AsVevNOG+xdY0XRe1JtlJp
 v0DXynK5TAHgPsJGEigFEfyrdw86G6CgWZ3UZKRcD/Dq5cXIw88eBz7D7CZS7KbNzGEkTwrhx9b
 4GJtYZ1ijQjD+huz3JBLUGGSJAjhcNKkuSDyAFI766cghC+iJkNSst9YUkxfBoVScGqLUBAn0Z/
 HlAGOzsZvxy4PrmIcTY8P3p0CqTOyiIYJ8rfrDoNYsEV8SVOKAZxm8ejEliP1jMWuhNJiGvt30x
 RJVrt0eBbhU36wjBfz4aUJ+BiS+ZQGr0DJ9HySd74ON/vxtU6Ldq5H4k6UDRedgcgcd4iDUq
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681df50b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJKz7-gl4_nKpslyRI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090120
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

On 5/8/25 10:12 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +struct qcom_ubwc_cfg_data {
>> +       u32 ubwc_enc_version;
>> +       /* Can be read from MDSS_BASE + 0x58 */
>> +       u32 ubwc_dec_version;
>> +       u32 ubwc_swizzle;
>> +       int highest_bank_bit;
>> +       bool ubwc_bank_spread;
>> +       bool macrotile_mode;
>> +       u32 mdss_reg_bus_bw;
> 
> This doesn't really seem relevant to UBWC?

I'll admit I just took it with the rest of properties for a simpler transition.

Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

> 
>> +};
> 
> The comments should be copied over from the Adreno struct. That was
> the main way the meaning of most of these was documented and you're
> deleting it here.

I'll do that.

Konrad
