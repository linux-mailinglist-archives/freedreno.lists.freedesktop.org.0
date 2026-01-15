Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9DD23D9D
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 11:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF710E731;
	Thu, 15 Jan 2026 10:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPzvQv0t";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaFEu0kq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A063910E731
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fqrA1745019
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=; b=CPzvQv0t+5jnexkT
 oncy2Dbo1565GT+hNtQto9snPQEMr9aGXSogDWnSmLM0rvXtqjlcj4d0P/Z/Ll23
 Ipu4g6vGVDgmG2Y4Yb5iSF2c+JoI6CwccJM4MCiMLQ//wBdV0f0Jwa9SCcYwMRjw
 b0Y/3nXzcI/O0L/Z+l7uhJKy1MPqXk8AeomlRxG2RXUUUfMmIc2I1uoluqxt0KeD
 3NClpsRLn3DRfEfVEvNfi6mWT6kE9d66PC8aToyA8JwqNXLXA8QRKps/W/Ksgao4
 scn9KUBEUpSES9Za7PTZCv/fVf4XliY/U6KQxeibei6uQ8mzf+fYHlzZB3TWi4wI
 Pa7Rww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptu2gp92-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-501476535f8so2366721cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768471927; x=1769076727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
 b=RaFEu0kq6JqmB+su6wb4SbI17MkZxicuaLJRFjLXFu8u1xXHNi22msy3xd+0I17bDm
 JRY23S5GEJmm9LD09Vu5QO+HfFVDcFNkg7nEfItWDY81xPVj9e+MjL3k//eavW7KXuHH
 fAS366a0Hh6MMjea8r/xIHsgxjgUsGj1hFMY4tXE99XX0tUvGRonX2STADNifVQROGA/
 aYk37CaFoqkqns62MQ86QUxwKHdUBBjSo/iYmJnSBRXcRSCoWjhJ/qSvBGSoC5qyQXXd
 q0akxs2TUkfai+iwM5B5Rv4/W6xW7zDNdIHY0IhCplsbf102XcoajPcvsd8XHD+mTOrg
 2IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768471927; x=1769076727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KiZ+TnHo2tA4f2TfOgmaOGzuxQPX0E0QWOJIMh7jkk=;
 b=KolMwL6cv/LiTfQdlrqt/YC6tJVLp2sDb7LogWjcTDIxKnJSkyYZ8tWSbPfejQAY4v
 uMvfuxYqNRYr2kMAEY6S9u0BS9PonypmFacNfzfLByKbs2te0Q49AbFG+/T4PMwKbfeg
 h0CVjygW2k/CcUXyujnCQtn9/O4rNDAyL3Wp3z+HGrOuKKsqcXvXS7uo1Mioui/pYlhj
 0NqUSpG+L16n07fMSFuiaDpbV1MTIHpNXs7QNMJqVNeUl8VJJU65/4aj6aOaErOVxe5M
 6v9qTGuUPg1IaQyCvRfNb405Xva20Io9ZLmYbWPu+wd7KCMAiZRyWvDQC2NFohZHca55
 jtQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3EUj4I7TMdL97a5Gwj19pFZ0vn4omeaNEW9BsfM8RT2s+shjTG8OPvaSculy41LdOyhLbJim1mBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfirYuvQFy1mDRc3j9PqTxPzH/5KK/oDeM9TGHE9ooIIhaXsFH
 MHkCPk6ZIPCL30L8Pn79ywnPPiE9rpvlU2eVwl0g//6hB4uPiWd3lubnCivL32OmdnVBziTOkCS
 Iw6m0yu+vjLqpqzmV6fBfOjOQkhNk7CVRimJ65qvBc0Dr95sQ3Wb8KBz/irHMqItuBKqdD1Y=
X-Gm-Gg: AY/fxX7NnATK0QgqVbUpy06vyUiq4XK3lXUF/lGYTDqcFoeWLva5bDMOUAAjIzreN8s
 GMuEWnxJU60bjfUE+1/JMb96YhLmIYhHFsmqUQqNLWhK+3685WL5NOzK9Eg6zusFau8S7WfgPMs
 1PjA06tqn55MUNmlACsllL2AshbAePvSZIXVGD9znYnKq0U1HO+Lys2W9K9wHS0F0FJ6ty3/pO9
 MGFMfjjdPnZWXKikU1/KTI9RzlUkjY1qhpWHwqppgsmIo8w/4+DjgXvTozJV+F7a0n12MNT3Fd8
 TuaV2UuajOltfBAC5NlJkAL9EtKcXW9DO2YZIv1hsWwQWFAvcAVe1MOqalosdGgvYzrgBbnV8V6
 Tz7kfynj2FoJmWaq1Nm3Jq4bl5+JOaMlcMxdDlhXTZ4ajM7owdK97tI8/mGMF+3MBFYw=
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id
 d75a77b69052e-501481e98a2mr65006061cf.1.1768471927083; 
 Thu, 15 Jan 2026 02:12:07 -0800 (PST)
X-Received: by 2002:a05:622a:1454:b0:4f1:ac43:8122 with SMTP id
 d75a77b69052e-501481e98a2mr65005841cf.1.1768471926686; 
 Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a563f0esm2816455266b.60.2026.01.15.02.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:12:06 -0800 (PST)
Message-ID: <d98339f8-7296-4daa-b625-0908ecd3e65c@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
 <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX4EU66frsBoIH
 tW8w/xQaewEI1t4xf4laaH5BXxr1xyJsXILa4EYMSL6QNAg0DYypTsHipx63Bl3yqBRwYQEBEoL
 +wjYArZ7KDrdXbFTlzkG1tRAZw+2ELZq567TF9eyxj2I0ycLiuwKSkXVU192Zvz0YmITlyj/MT1
 D3JXIDQjfRAKhkgSKKODhnnfvGDBEPyYL+JQp/PxrfAy9uJFAe3HrxRXzrWqH1gdhf3Oz3Hburu
 4eSu+c/71Mx5hcWjGKk+bHHkgYm7D2f+swgh8pYb3eyjHLmEUOENH0AuFDkipoX6UL8uBJypnJT
 DLIYMv/W36K6GAoEU1YAJnd8tvJYc6SRtojMopJr7b/C15nTNTRyNhrLBYCv32WefFXbCsj1x7V
 Gq9PHejW8bl73gm5hRT1AurJcZZCl+0/JHUbCFcytay1n54zC/gsz7zDqYjWe1ZZfkL/00Yz7M1
 5NJbYy2Tr/cyaJ2wYiQ==
X-Proofpoint-ORIG-GUID: nwKvB_K7kXX6_jNh3QWJAqU1IHEOVJaC
X-Authority-Analysis: v=2.4 cv=W6Y1lBWk c=1 sm=1 tr=0 ts=6968bd77 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_hlmpyr-2oR44aeFeVMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nwKvB_K7kXX6_jNh3QWJAqU1IHEOVJaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073
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

On 1/15/26 10:42 AM, Dmitry Baryshkov wrote:
> 
> 
> On 15/01/2026 11:41, Konrad Dybcio wrote:
>> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>
>>> Currently, we queue an event for signalling HPD connect/disconnect. This
>>> can mean a delay in plug/unplug handling and notifying DRM core when a
>>> hotplug happens.
>>>
>>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>>> handling.
>>
>> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
>> also prevents us from checking *all* connectors if we get *any* HPD?
> 
> _unnecessarily_ checking all connectors if we know that HPD was here.

Yeah that's what I had in mind

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

