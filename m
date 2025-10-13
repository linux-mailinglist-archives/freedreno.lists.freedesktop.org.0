Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D1BD2FE0
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 14:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABB110E2A5;
	Mon, 13 Oct 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKE6Szt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456B610E32E
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAcOSh021490
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0c/YLYaDMoEGnP2p+UDoLSwW
 bwVJnzjUv4KnwNKCfEY=; b=cHKE6Szt423RB8gknU+LDvdj0Cuw4qswyTZSaxAw
 3Vln1wH/aKoGO3yopYn8nbYnpcw2S5NHX7Sm79VwKwLYqcQLc+ZXI9mJfef7hziV
 AKyPZ2BlBcuN5v238ZNwTY7D5BQ55vFbmhOXJXLfe40w7C6yQPCZFlJkWD+9Scay
 ynngzBZIK4MUfj9Pj6V8NhLYw4l6QgLJ27bWbS19Ao6+8gDR/kWDmmWrjCyZLQJS
 Drz4A2m+5QZP+VC6nw07jEHuiMMqSvOsKt+L4sJGzjlqmM7rq0O7DHaJwuV9FO5I
 WjOXqD+QR0hcatHH0bdFdVzbAjOv4iTSBuOaVcQi0GtIuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh64emg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:34:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-872d2ad9572so2361468385a.3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 05:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358873; x=1760963673;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c/YLYaDMoEGnP2p+UDoLSwWbwVJnzjUv4KnwNKCfEY=;
 b=PBs1eoKuf4t9rmRBEZ0cqSO2sB2eE019T1XuIkB3ySioq06NmEwXQKa42PAtX2NnHF
 dENeka3zP6zv6Nvq3MG73cBqho+QYKdu6wYeGVZt41BL5J1LCJcaui5qGQerQpmeQdPo
 l2smibFBZKKmGTGNtAp5WPzab8dIxg8X5CUCmT/06IFGJ6Bvx9ajcugZkC56LkavM0pd
 FUyRwwAhiqABZLCDnzJNhdQLJPgp4LyLE2hXb/RsEctG3a3McHgtebXdm7FOhzp7P5rz
 t9928wvrnCI4UV52sjrbtuQcfz7OnYjk6Uw2kAtvJur5iP2EC/lHss7WrGl0ILaXZwXJ
 MhgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD/f6w5aYaUBYVXjwieRi+gwJ6oMyUZ4/NtbUqhw3Hp6lquO3dcYkJFiFKWqoXI+igwqAVX6M24g4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt1NQgEBVrYOSxV0SNm4nSHmTLSJfzl3ANXrHSHAPBIqxdPu94
 7qGj9eeIXh7Kw1SRcGW3wI7jLGJHWmI9S+37eDNZi+Wws65TJr5eq3kvR9aq5+hJYMOyOJlBW2t
 YOiT13FexKguzCE4itsNPxn1xO6GY+ZkWEOyhjOqGiPF87YbcYjeAX8Z3golV5Rf4p5QHXU4=
X-Gm-Gg: ASbGnctratEaXEwEsD2dq6nKq9Ys6q80mo4vmxlfKMCwwPrAMNtnzzUlc8XtGBWyysU
 XahSfnoxv3MkkC511zXCLFmZq2Y3feQCcnjR5sk5yNVtS/IX7oJbdGhuIysZi/OEByj4R4meMGc
 TZFkNOSUv2273LjvnrY7UHWTA7Qx197KHc30Kx6C6YSvxsyPaVi4lBzhtmpaDDOIX2oo7reRxEN
 1W7m7LBJP0W425zgdCu/V8sovyTWN5l0bQkEHTyCV//SWOB/c01GzwQoF0gHSFSbsBfMfRt6+AA
 rLGtyVK3/FR+AIc8qWF4aj3NqFhD3ra/+TFzwr3P+RlJb+vYTVmHXfQKqze0q+3s0ZyTG8Iu/ep
 2MY1VGzWEhQbbJbZ1sh13jyOSPFlHDeMiLmhI0UH5LTSQ6Di9XRDH
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id
 d75a77b69052e-4e72122afacmr71752681cf.13.1760358873409; 
 Mon, 13 Oct 2025 05:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNbh12YwL4Iy4NRipEsFChMHtKqDe+smfm+D7B0YFilvKsxmQIYfhkB/7L1zjAmITtmN+oiA==
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id
 d75a77b69052e-4e72122afacmr71751921cf.13.1760358872891; 
 Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881f862asm4116608e87.27.2025.10.13.05.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ecf1da cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sf-Njp88EExxdhEklOUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfXyZp5OhspSof5
 UMI14LXGemTxkUoToNObRJgt1Brhu/NqCb8iJsy/G1fAFqG8kRBo1uG5HqyF3Rkof4mmwyTUHt3
 NzCQpzd+0w9ObB1DDGSkeHbl67TGDse28Ski1giamrAmkJZEYZ3jf20bK9GTX3ZPx8fMRhcGNKK
 +63MLel990cvdEqn3M1ZUljoy3aV6s8vDEE/NUEX4WT0zI0s3wEPtUZXR+4Dj6B32HZkoI4F41S
 Jh0BSl/+F+inKz+sN9/60AYoN+yx0SjWo1xuNrqTDuiO8kaHyG0/ZaiLPy1thPG6KqhDPMd0gOH
 2kSIHHu6+9pUHSKTP6g33T0eBjU7TAtGiga0+MQa2MbEhKDQZ9vzbYidIyUJxA4uCvI5LEVAFuJ
 wcb7VR46tbWMhyldfpkSIccs2RNrpQ==
X-Proofpoint-ORIG-GUID: l091LdhiIGzrgUd7y_Lq0E83WNe-5VN3
X-Proofpoint-GUID: l091LdhiIGzrgUd7y_Lq0E83WNe-5VN3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
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

On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> On lemans chipset, edp reference clock is being voted by ufs mem phy
> (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> clock is getting turned off, leading to below phy poweron failure on
> lemans edp phy.

How does UFS turn on eDP reference clock?


-- 
With best wishes
Dmitry
