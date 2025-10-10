Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66763BCE165
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 19:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F51210EC5F;
	Fri, 10 Oct 2025 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLdLx7Xf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE6F10EC60
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFmxTP025709
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=; b=iLdLx7Xfko/0GgWa
 hbPzFA1YEUyGGpWqBgTsZYy7efzDlklzJJDrDRQ3e5AI4TCr+7RK8nF3S/IC01wG
 X+tvOzVklpiyOdaLJj1WRX6C2C+2RhOSWdZ2GU0i9I2aR4KhuJwLcD3/HGzPunLc
 1qHNDnxOEuM+vgPZtHh+sj205MMZ65m0r5h0J1BCd61SaSk/0+5KNK8CLb+pbD8C
 ttBfrI5LjG/tva5xb/94+AhEoeFAj+8lkemNN8S3eqtpvcaqVBWYN5in7kCsA8Hy
 KpbWabNKwKJZtcvMOB+qpbBm3iRFyBEKZsj0gl+mnQHuKhC2X0UT91XTp7BD3+HT
 Q6l+yQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nf7yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 17:30:09 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5a34fceaaacso359757137.2
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 10:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760117408; x=1760722208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ATXrLGPewk+USu4WH2tPmXTpI3iF7n/KZMdGkOVu4WY=;
 b=N2JR3FQk9V+BprBw6ui+SecP3o2ySSI+ejBS1ijoGiQ8iAKeFcVnb7aXHeagitWwk0
 AzU9zZPZOEsxq120wOnV31R+SEQ5A7XG6lLzrr3nb9B+6rQ/KBenZOh/xc9MJ+tqgJ2u
 LLt2i25DlxM6z5MxuzJ6VniGECf21xs7ZbhgronqyKu0t35OI5i77ARbvrcUcDTDfuha
 eIKGwELoOYOq7MEnXUxvlVyOKX+8p8cAofKZX3f41WGGzjKVdOOyErX3hLxL6OCPJw1V
 TalViT8nT75PJOBJrtW7cjihjyf4MvAqmJYuXE9/4S3qebGw1yQzepJIlR5linws1BCw
 LcZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6NkvOhcvjADIy3Q9Aw/UM7xUfCxcolddY4zc2RnRZOkm3sM3Ej9DBSlLc8SPXNLb4QXk42AyDb4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXHcDWRreWVEc1aaa5ZIs9bN5NYFXpomuha+BavMAQw9piKEkj
 wwM4ebgzxOC5Vb/OzdeLhJCnsNyKHAQqmwxykh1WP/roSGSb/fzb0s311QuVnscEl/YnglCKZIe
 AqJMsSoc+UWHbb0SiYkyrlSM0WQHuhdcEalO+AtMAuJGKJuGBlDKWBfi/K2pWtp7PMwIB6/4=
X-Gm-Gg: ASbGncurlZcRu9ki3cEW3RAdhzl7zC7P7RPYzbyIJkQzgdzA0MwDTv5QLX5vLL6dGXL
 tGrzFt7kBkdXRGdOoGSLzO8Lcq44VpK0LX8yQD7jTY+79osdM3CRSCpJC2uPyuiP6zZTEDvwnFF
 G6oTPRe+IRXlhZ+5bEhMCuYOG3h/DZxuKBYzIy7299Uuf/2B371zCwg8UjL+oMEdswVkb/C4Hii
 b25gXFz5R1CN2UbpoySHWvdSEYg20MboNMdxwpIy8uqp0TSy8DtpATn40X4RPqBiZ1buOHXIy3z
 Ohht0xCfZa8dGrc320A1xdDYVYm58GztKis0sUavGdU1durjqivSHogt5fwMvW1ahWM+MVT2Yba
 dxZmo/RgP8bz1QY0rpbIc+w==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id
 71dfb90a1353d-554b890a550mr1451423e0c.0.1760117408358; 
 Fri, 10 Oct 2025 10:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHD0hhK6b4JamkLYHPshkWQ8JHKI3MVUIkzRHAZmhbAXRpyPdpO2PcbsweVGgxi06rXqhX5g==
X-Received: by 2002:a05:6122:e0cf:b0:554:b341:2764 with SMTP id
 71dfb90a1353d-554b890a550mr1451416e0c.0.1760117407888; 
 Fri, 10 Oct 2025 10:30:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321341sm2786754a12.38.2025.10.10.10.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 10:30:06 -0700 (PDT)
Message-ID: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 19:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e942a1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=XV8jktkr_dr238JMAFQA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: eLf_LnBLbMbcKCpmsILmMXyHOwz8Rvjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7BmU7yj47NzV
 cac82QC9ydNTJiNjsyfqCKlgRtXnXx3LjEHGgX6P6slQp+q4DoOvIyi6pE2kIe875eDVCn6Jw3T
 z2Vpt/Z4b7wlUYnw9TtqVnrzKA1tTNf5Tux6JGz7HF3i5G96JEjl2P0tZFH1ritrKGN3WSbj98H
 hFWeJQgsKIJroZR1Zn4AVEwyd+7xtNgFChP7/tFobyfFyQJ5xln1qlN7FHSpLGCU/POieM3Ck2U
 FGvlo6W/6v+Yx/1ixbk8rBx5eTHV7SzE6NyrBP+kEVqYak0Fh5zlgd6TNQxBQOFinP6g/sqxr7u
 b3c3TZslU7Txt7FBDuaaPQSxcymx5LTgYVw2jSuEx8oyfDJQGJm40dNpSpy/EdvEq0orHPLqDxh
 F4YSW0R+DAziKw5f0o3YigiSvdZ6pw==
X-Proofpoint-GUID: eLf_LnBLbMbcKCpmsILmMXyHOwz8Rvjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On 10/10/25 4:39 PM, Anna Maniscalco wrote:
> Update last_fence in the vm-bind path instead of kernel managed path.
> 
> last_fence is used to wait for work to finish in vm_bind contexts but not
> used for kernel managed contexts.
> 
> This fixes a bug where last_fence is not waited on context close leading
> to faults as resources are freed while in use.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> ---
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off will be removed by git, as it appears below the '---' line

Konrad
