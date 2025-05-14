Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90856AB766F
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 22:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597B10E701;
	Wed, 14 May 2025 20:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgCga231";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C110E701
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:09:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvVq015169
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=; b=pgCga23114O6VmmT
 itotjnT8ZAnXLMXtS6V+JeP1LinD6vPNywmC6dtAODpwHvmfbc92o7bHjC2PtG2H
 FghtV4lUgZfQCgDYfYXFhwo29/S1KoEQC5TI7ULR1vhA4452EGBZhJO3ca1YJvAC
 gLRDgZT0SX6lbShChAd2a6yr125LDFdWX/HC6zlKb5t3qg2ksvP6A/Og5Z7XZu8G
 ykqjCgbVTtioBZloyWbO9XCZ65N7k4nG8r1+Bk4aZYZ3JveBDC/29vt/V2jEg/Ec
 pgAF8QzG+RxhsRSDlb0hh+ogjUwO8m3N7dd5u96qfKh80zA8ozWPgIvzWGLgVlWF
 nSfZqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3u8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 20:09:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c547ab8273so1924285a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 13:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747253379; x=1747858179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=;
 b=MVOhLQLldd6DVEgTrvbFPPQ8DV+6ve3j3higISYRfMis2gE4NmlkuueAeZDzjtk21Y
 +aBT2Mj6NFEEpwnIUyEVuOs7wWekHfjgU1LXoQLrpX6GnKg1QQHYaDOvr14yvnX+Auz+
 yWiXIzybBk98J9QAB5p57vfVnDlVepBMkdFT4+/47g1yc8nh7y8UMUrrmrjnZsRhTm0m
 NLxm6zdaNhzYCLy304djuT3GNBGumyDbLnmfmFhkWFb0SuGDgsIhZh03G50mza4C0K3Y
 v9v2ZVNeTbSaQT2qvo5/uPLl2WaG/OgpFQjdI9KWhbGJuBNlu0XJ5xcHjOwFT4zcEIxc
 sPJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0QXVaTH9HSOsOBppExdLTGt3P9DpAE3iX3G1jVHCNuDEjoHVOFwPhKIaxy35SMJpGnwrk+7gO5ac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBjojDmXiWl22RNdtp7ShUtzXSS6d6rDS1NC/mhEZPdifxhvor
 m3no644uZed5ath+ObCTFV8swgif/ynA5L6Fa+4FfiLEB2G2slF8ei84Xup+lxTOhfA+/dX1wft
 dIJ9g2ycpcozw7iDkfysR2Wxu3rXNnjhM9yVJQChiTQuIrGFBtLmI21E4Ru8ISzsHd7Y=
X-Gm-Gg: ASbGncv+fI409uQIdwsJUKlVRFWtK2XM7iipV19/SA7Lc6l7m1MwO47UwKJ+cIqijhE
 kA21N98px+oVBFtZb5wiZZQ9J3mezeqys3hFHr9ACtBV2K8N1WrR4ebNCeQqNAcvN96pKHiWJpG
 35jF05IwjssCk4UuPDw5Zg021tygMp0NfhK2qL+9w5P3Paxcba9L+uu/ggtSXOzAuxEaNq1Wsp+
 b1tPU4KnoKFrs0mBowal5w3H2gvyVSbJYtB+I8dUqd6/P56OotUfX1e0taPqJEAtS4KwZ6jZUNq
 qgate0l//D60WjORK3I7HiCDUmjj3CTqkJ6AH4gzTb573vMuXzzx/IC5UuuDy2IoWg==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cd28891479mr285547585a.14.1747253379257; 
 Wed, 14 May 2025 13:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKpgjaIiOI/zTR2/+a7CEi24XetgHuJRRRaRXDCR27dZOWaJhtL6Yv8ouMIjlIoQO3XAK8w==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id
 af79cd13be357-7cd28891479mr285546085a.14.1747253378789; 
 Wed, 14 May 2025 13:09:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fdd088798dsm5606403a12.13.2025.05.14.13.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 13:09:38 -0700 (PDT)
Message-ID: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
Date: Wed, 14 May 2025 22:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XSz7tXwPom1uOFElpBtkMtxvE9P2fUIT
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824f884 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HfH8O6Keqri-gfDeQOUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XSz7tXwPom1uOFElpBtkMtxvE9P2fUIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4NCBTYWx0ZWRfX/tYS6YxU/FMI
 ABy2HH6penSYfX4xmepzD/oN8yZB+77LZr4c86EzjNAinln6rOBNCFg8R4l0/NWuOzyd8Kvba5s
 6eokNbLOQ0XzWj4Qayl/6X3XJulIyt4akyLOnHAf2kOxFxZtuuSHJP3HSara6EPOoQ9Lvbd/JOA
 sETwncgNWwxBI0/2NMXG1h/l8rex7BSmRVCTH5gUfjZOSAsRjnRQbmcNI1wok6VV+IHxDhUXUp5
 dSkgzEST3D5m3AyBBdFBVMhj0AaUWrmmdJUpu0/0Zzx41vLUslR4+9anqX2QyNHcioFVX6W9vu+
 6MCO+iyw14vyBvaEbkDceosDyXQ6EJzjUapg/bANeGkXEPqq5oQrDLbyvex56t9Gad5FJymD0Cx
 eUsUvJRtC0Z4rvFYqaLGobb4aRwwJtf0pxc69PsBKyur8kMgsJ040bEgPflRkUwognIdQokr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=838
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140184
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

On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Make the values a bit more meaningful.
> 
> Not sure if it's more meaningful or not. In the end, we all can read hex
> masks.

0x1d7efc35

magic constants are no bueno

Konrad
