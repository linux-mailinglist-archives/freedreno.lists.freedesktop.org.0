Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E28AB6FC6
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 17:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42D10E266;
	Wed, 14 May 2025 15:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cObmxX+q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205AB10E2E3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 15:29:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvQj030360
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 15:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=; b=cObmxX+qdKmoqnIf
 /P5Fz2EOvQc307k51BOfKNbJqQRFr8In46r+li2xDOwM++FM8ldWhn2gttYUzXbG
 Ao4tS3BT1G5hW8Xze9wQT0L2k7vxCCeEB/45IdwlWeGRUJCGa0c+OrXtsVAy8QtI
 H+f72fFpWjjqUxhdRIQMQoD/pUD9GczksELu7ZiObXJCHUybDon8DQhi/Pt88KCN
 bM7jwDQp7EqJV7hVFJtLgs5TXgjbVoF07ZsffoX8+/4RbMLkPGz+HuDy/b5K+656
 09vG6Ul71ENjWpFrqWdUnb2KaSzWaOusrzhiGzElUCCrrMeH0QpO8H4Kn7a6qRvf
 erzDSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnu666-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 15:29:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso189619185a.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 08:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747236558; x=1747841358;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNhh7tTrtVppZOM44aoAsiuIMid4rGaB2UXO4+XqS44=;
 b=EYG9XST6Heg6BhNDX34GUV2pac6WmnyJnsm0Tq8BoSUZusJhFjs4teZiD6qDXR/Cqp
 dBF4SVh6dY5kdjtGgOQVh49zgtHdSnYy6mvpjxQm/qOW1mxvsvK2d0ffb7Fy0dBy9Zbl
 yzfbp4ovq0ej53czm46FWFDr/tci5Ld2SPgOch9SEZ9PWWR5YbZ2y4WdIZ//1dN+WLqA
 7vOwCwN8uqtgzbYDAlmkkj39ThWDV260oxs/t7ss3bqvnkEd0716EM2mfGWfkJMskhq8
 YWHrKnOckbjPAeMFi59IulzpVyRO+jc2n+ihOE22Au0s44cOE7IMa+ngfrQCb8Jj5Jzw
 COgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9LJAm3BzlpU0iIhDCKuuIvT7RL1mmZ75RgsxbA8BUNqR+421PTOhimPEKPvBuiItvoGT17ANAF6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0/Tz7xEOU7ojZm7DhHh63hnMGWwlTMaYyDjCPONY9SbKfcqOg
 bic9IdXtx+49rFOroeiL79YhKCsJ3xZUY1iIkIJzZr+TjhkhgEICu69n5RT7jcPqcJaKO/sZqw+
 qIwR6HcKe816os7RrNpiozT0+BibOLU+70pNtPo0Y6tH9ZzD1xXtQFvG97Rig+GauHpY=
X-Gm-Gg: ASbGncsNj0sfvcPhzBQHAULK+4M1YImn1BQdgh0Va+fkcE60IkHlDriTrRsgf5gxzcX
 E46puSXxzLtPufuCOUG7x+2cDUxG8vlh8yn++kbxlXPgr/Vlft3ga2VHhJrAnEvJ1AvmQFBiwml
 jgSOXoB6s7UAyysp66Wws9NoEWDGxsQxhJ9pjoI7bdfmKqPIRC7FRjFa+Iq6LojfmxJkP1OyMCj
 K9iO3T2ZoiXIa5VyUuRBWLbDzUi4GF6vrVbbQJK3V/Ke6XwzARJGOAgOW0a9zrARiOOssAzIGSn
 aMclErXeMTjXEuyp0ndyVh11XYXqb4+4aYvftqfB17aoGCz66p9IqQnGvLCAYVRV+Q==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id
 af79cd13be357-7cd287fddf3mr234613685a.8.1747236557707; 
 Wed, 14 May 2025 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESSnbZfR1OlTiIaVYJwWyGGbrD8XQ6bq4lkNbvhbCIEFOfDySQCqDpAoZMS7HgH50fPKy8fQ==
X-Received: by 2002:a05:620a:8391:b0:7c5:75ad:5c3a with SMTP id
 af79cd13be357-7cd287fddf3mr234610685a.8.1747236557345; 
 Wed, 14 May 2025 08:29:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad505564d46sm72730266b.121.2025.05.14.08.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 08:29:16 -0700 (PDT)
Message-ID: <0e1e112e-e9ff-4d02-9779-6e1bfaea6195@oss.qualcomm.com>
Date: Wed, 14 May 2025 17:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -1ZqCzBFMr7CTHOlH5mF4Z9SbUnQ7aKX
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824b6cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TDUkdBfym2ZfKPuXuAoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfX9GM4s7k4bkBX
 UjcFjc0GZa8opGSnVqte2hJPUvA12sPidIR0vmidg0zfqZ2yJfgcadLRw88aSTp3GlnRskCU7aS
 N9rsFvI3g/PKONBRd8XETv1kdbLktNPE8JoPU10PiTaY9uLSear0wTZzGVRn8pONaQTpXNXQ66/
 nEBQ0CEq7A3HG0fqBAHRdiWx6EQkpqzQnye2b45Bphen9lLaX771xy+2sI4edftZjGOg4fLzUp3
 dHKn5Lxyzsd7kY5VV9iQ88wKZCQXvmwAjiBKylqcnjKgLhwXzwEawDdi7AhluVPsK9BArkt8+p4
 tyz7M0yAr4GyClWh4HS//DYW/u1pbDwp7ZPPYy4u/Tb75Lk8insMgihzSzzySzeSVc3uAq/TJOJ
 kTgdtWTEDuRqg0UuI845HCYLcugybBVJZxu50529mIqFZo9ipb3XQWNIh9PYAAi0L2cp/l37
X-Proofpoint-GUID: -1ZqCzBFMr7CTHOlH5mF4Z9SbUnQ7aKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140138
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

On 5/14/25 5:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

> +static const struct qcom_ubwc_cfg_data sar2130p_data = {

So I failed to add a user for this below.. 

---
{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
---

Konrad
