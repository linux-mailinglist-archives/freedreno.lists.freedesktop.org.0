Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C07C83866
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2003E10E348;
	Tue, 25 Nov 2025 06:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAMItyJG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuTmrpE6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2910E348
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2giYq1232373
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=; b=KAMItyJGXW/Pi3ry
 dE7sQ6OflnLQJICZGBl3oPgvnIf4G4k7Dtip5meqRdZYTaBDpzZ7BHjq8N0Dq4Xm
 g6XuZhitlw2oFVny620y+8k29FBkVvW/QQiwTGZUejE57i2/WDdLNusHsa3/56Qb
 v0+Xu3aLF6EX4BNvAnyp7hwpt6sSaBBxCwjS5ki7jzEh1MVqjYrX1W0d13hZ4TIA
 3C4UBgRrRGXXbKUe8vAfRdBiBZhdu5AUdNKG411/fnuz4Kj+XIgepmFrvZu53NZ1
 OFVBvVDch68PFaH0LcyAH4tBC/5yVYxuqMV+EFDhcPuZD931U4Zb+rP98DjS7ARF
 ZleM5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyh2v9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-297e5a18652so58053755ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053245; x=1764658045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
 b=CuTmrpE6S0bCuTwyzYI0K2sfHBTrEix/VGt3TBwbU0fUv8zdutdDuqQyZz/IiuvrVg
 erBu3kBNk2rxwn4+ebBFS5CymcQpHPcbQn5LAd0WMHwmd3SGKnB3IGhMfNDb7az4Sepf
 pzsRAGhPmsiQCQljd0QaTKoWIgjo54z4daRCra/6kLm+hXy2LaqUHCQyl5h9OCWi3B/s
 6+x8hRN1E1TTJKxB+EKhiwmSLWXjy1e7AXalM4tomEXLhKYEJX+hjv8E/iORBl1Y/rUo
 vMCv032fhjeEm0YZ8E1lgo+iVqQPiRDmoGQY/kYcRPlRKiId3MUNtqJeTlPFwPxykPqf
 p5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053245; x=1764658045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
 b=mV42m78UpEgn4ujXGIdhpF8hsndSyAjB8e9v0ek9BSIRjNMPEB9zHYyCBbX1S0v5BE
 YwoOMuMglZ7uJ1WXlLhGqi7dwI2/DrKFF/w/v+mHUzdVD+5QUFMJGOMMkn4S0mrl2V0U
 o+XTlPeRYJVl//knFwklVAuUZ0B64XDtGxDWU5gce+IJnV7WsfcEh1N5fPBXfCZ8J9ic
 Sc4mzBgNQ+6FqmEyqsYWbvoeX9CcWEcCijvqKwK8F7dbLX2JE7e3D/46i3SLX6MHlYzM
 iSv0aoNZsCzMIOIvPRWAAsa/rR04ICeDmB+b1BMNL101TP/yGgUdpPUHr5vWVbavujiO
 Zamw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSaxN6rAVEb1G3549n/XqMx2I+jPZjNiTklP+6KhyRyjZBH8nFG1pIaSPH7Jaickn0YfKZ9GuZQiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdZHW4HM8f0Mj4U+uNeJDgr2S+hVM0IQYscmNOgZIl/LGDrpdB
 Nkq8Hm0MiiNUQzyMrxrqQ3271CA0kstPUAD1z80qCzjeL70pPb3blLf5SQX6qR7SS32TGRXmXF4
 UU2vBDmAQ2URCcfs2nYN6sAH2TZYzJVBY+56X6Y3SK1c8CJyD/nFNiSQ4yUwb7eVCdR22yxI=
X-Gm-Gg: ASbGncsIYSqzkuIZY+eRSZFxArjoNlyKZwhXKsyS/P7prKZoKXdx2odVdNMt/4Vl5fs
 29pV2RDQCyTYxdlwsjWIroh/sogKIYPWXp0hKDlHxeR/MBdCobrlI35WSTX/8Pai/auiKChlFjf
 6Q5LekR2mN0dJu/MwtvcCWADGbpWQ/pyEYhvc7jz2tEZj+RECuO5bVlWNfNlSvTUXhKOvTM/5fm
 xWmPquQxlXpgpVANnGKX7StMCgH39iXUQYdbqqTc5TymnpMA+y3g1zcgU+7fI1v62inN1JGGptn
 2YiignX6hcKdpd/mO7DsPWrxUXLF2g6Ksf4U162fsL2L9ml0d4Sf4n7a5rIvbWxo0dBSxgVFI2S
 jLKChTWxGKd0OvnkI8roicrN2IhbjEzqcXstWuktQxPRCASUZHPRNs2vyLhTDbfHWh1g5qQ==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id
 d9443c01a7336-29b6c3e3c48mr173257445ad.16.1764053244797; 
 Mon, 24 Nov 2025 22:47:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmIP2SmCaWX4l2Q1mTmrRkAYkOO9IckP1bEh+Ip5Dio5d5HQJ6eWo4kL/upXP1t6txnvwWIw==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id
 d9443c01a7336-29b6c3e3c48mr173257205ad.16.1764053244243; 
 Mon, 24 Nov 2025 22:47:24 -0800 (PST)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b2ac81bsm156886485ad.93.2025.11.24.22.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:47:23 -0800 (PST)
Message-ID: <7b243866-a877-40c3-86cd-ddfb582969eb@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:47:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
 <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=692550fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Sm_-M3Yy7wF-AUM9z_0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX3egjXPJYrvOY
 H1hVsg6E3kQJFSoQMXdybbQWghWoIZz1k2bD14J3/PQYPxz1kumTWsCDkG1A2wUigd8nvXe+beJ
 duKGmtNOC8Df6BGO5TJrS7fzTIt1xBNCAyN8u+7AHVW1wZbdqXnoL53SHgXhR36kXdszV9d6xy9
 RJ9sleOuoRzUYikI+phb02fMBK6XuDaoanb3yl9EmOeO/RspZ1yQmHFWcvrYFF8NWxggYtgpewz
 syp0UkrR0yHi4d00ysF9EdwoBaoAOPGb+EGgPWOrchICtPdHtXBU8MWGcRdmA9n4ZbOzcfDzxsg
 6lmK9s8unNuzZ/1jd+0dss6cFCJGqBa9Yi0IYMw6JdMSs6rFHCxYBBaGozBRxfhDDzTR1PjrqPM
 R938JnUJX/H8WcprUeAItC2Kjpc52Q==
X-Proofpoint-ORIG-GUID: 9v1CfqfyFc3F95d3CRQDXLrfmy-6rFng
X-Proofpoint-GUID: 9v1CfqfyFc3F95d3CRQDXLrfmy-6rFng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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



On 8/27/2025 9:18 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
> 
> Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
> - 4.0, SDM845
> - 5.0, SM8150
> - 5.2, SM7150
> - 5.3, SM6150
> - 6.0, SM8250
> - 7.0, SM8350
> - 8.1, SM8450
> - 9.0, SM8550
> - 9.1, SAR2130P
> - 10.0, SM8650
> 
> Please update them them as a separate patch.
> 
Sure.. thanks for that. i check the HPD, INTF_3 should always being DP0 
MST(if DPU hardware exist INTF_3). will post another patch to fix them.> 
For this patch:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 


