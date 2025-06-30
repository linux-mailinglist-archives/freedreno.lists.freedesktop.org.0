Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D45AEDF7A
	for <lists+freedreno@lfdr.de>; Mon, 30 Jun 2025 15:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81B610E0C0;
	Mon, 30 Jun 2025 13:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/x7GnYP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD310E0C0
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8D6IX007050
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=; b=d/
 x7GnYPjDfc5+P3s5A4GfdW6ZT7EzDKVz4SYgw21z9BPf71LWmPsRJC1BX1vXebAH
 7fJoLOs2hTPImwXK8p0PwzUvPShJTt6yDQasSoTPdNJeMfdk7o+xhsC5uMwcs4mz
 wUhSYYcWfDXf5QN3iN7OwyvkrIvdEV4AmJsQpjdZ79pCqCJNMOqfixPZ4pybcn0k
 JFkpUWjZm4L6AcNOaMmmjPVsMvzYMgMwelxCKqSOGCDghqNDkQS+dw+LAy46u1lX
 PhWqFei0v7GigR4J5/9BWhXi1lfQGAmyQ5gIb9a+5TP2DwD+60bhavkmiS9GAXt3
 HgYSX25pl1EHBQsQbGUQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j9c7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 13:46:20 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-40b23f07cefso3598096b6e.2
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jun 2025 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751291179; x=1751895979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=;
 b=UPOM7PqzbEmb6DSrmVV8LNqmK+hJCDw914aJbCJr20S6V/Mi969E6rGrXUS5APXyqx
 qDoeSbq3BABn/WsL94kYVofvqD/g+3AqCt9SBacSWcxrc98WDGr3LbpSfK3WZVwV9inu
 dFJuY8fHfQf1YUT8exI/BwBeXc7CmNwfuQXD3O/8Y3/8pE/6jDJl8pHYC4hWPaYBAnhq
 Tzl+LcDSLPq2kPjaPzEpQqxgj4pyGwHLoB2kbVlT0f9QP38EcvIkyw5O7KH3NGD9TWnH
 VvEFQSDaz3tVzJQl02YFzCV8c61AKm0ROBYrXno7H7DUiY58uShMUVAG1EHHf4ankGd0
 FxBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS/pzD2Cht0mXt1Vc/+vfNjdNQpfR1/LMRyym3fwSOayKETQ3eafDTuN3QrrAuvO0Dwp1dbuJkZ+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt6hVcJC/3+qEu+ZZl9ipTY6IUIxC9O2ZERC7oDDrufamkFPOI
 MonMs47F+UdAqjxWSwwtEtPbxSfPqJ1ILCI8DfhyTuMCuX8ZLLxXRt5pplYgaurX3mKPtigNX2j
 NBhaHQDnycqMtdHR9grsdVgI6lln4I3amtq+2nYT6LdBXV/pbR9xkgWDQTgWwhsl4EtoQp1xYbv
 GBRTIk3yZevkV40qmEk9i7RhyI1pSXQ3KJBQSwL63piGRmrg==
X-Gm-Gg: ASbGnctoyka/7AbPZgWz66Qnu6Oh6FOtnnaakzMRB1dG/x60Z5csOy9JdjcX1G/drM0
 XUClnmUO/AC4FmJ17jKwJTHOCCAm41DDev1zTBUpWlK76uLuMCw9IEYTRFRe/pW/ZEoMj9O9s+M
 uwssvX6IWzlI+/UvW4hHBkzYf3C3LCwBgsUKg=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677498b6e.11.1751291179438; 
 Mon, 30 Jun 2025 06:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/ZONBovjaxT4as2yCPYzH6bLcayS9bEQ9eiCn71Z5acFjEn88qadQUxBV/FIurbHxcQ5liO5UIZuHKwhFlA=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677478b6e.11.1751291179085; Mon, 30 Jun 2025
 06:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
In-Reply-To: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 06:46:08 -0700
X-Gm-Features: Ac12FXz1ANfzhNdQG9PbXKs-9CTqnjt4T4STXGnoeX_oH1xYF5iTCEgVXLupVM0
Message-ID: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862952c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=0RMLDebWjREeJsuOEsEA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: mdRuX4wGUnMyFOPFA2hHzFwVKVMLPwFB
X-Proofpoint-GUID: mdRuX4wGUnMyFOPFA2hHzFwVKVMLPwFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExMyBTYWx0ZWRfX4N/y9UeQO3w+
 3CyykSw9OnDgkMQNMS5RnsV88tDkE7XuUXC8I46tMAmkFwRP0r5KlbD8bbVxUPuOfvny/uQ9Obf
 BdsLVvJWgfCwj/rtLeCd4GG6p2uXJzAHn3xBiRH6ALJd8OTFv6sacdNMk0SgL9n8qZ/22Oq7KoH
 vhPabHfXxgXch3Jjif0nik6OAx5zmptloz5Y1VzAPSgcV+m++XmXRL9/BUoQHV6D3a6SOn9K5m4
 ERBwrEGMBxSXCLNH1z8y07D9lKLI4PBC3ZC1tBJjoVgwbvWfrKehh+gJY2BFUIYQUcbT0rWkZ6G
 KaDcNEcOkvl4cpHr+5nGPpTswIT6pR2i2ecfOgri6h/Ug7fLzC5aWtvSP34OqF4wZRSnT0ZCD41
 58AODmfcmR1AIOFWOugmuPSzJoMf4Ppk6It01R4y8YIFe35KnDMi8Vz+zUzf8CzR5EdxvnUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=744 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300113
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 29-Jun-25 15:58, Rob Clark wrote:
> > These runners are no more.  So remove the jobs.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Do we have anyone using cheza at all anymore then?

Probably not

BR,
-R
